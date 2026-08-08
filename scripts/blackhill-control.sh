#!/usr/bin/env bash
# BLACKHILL Control Center — Premium TUI
# Version: 0.2.0 (Phase 2 excellence)
# Zero extra dependencies beyond coreutils + optional tools already in the stack

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

print_header() {
  clear
  echo -e "${RED}${BOLD}"
  echo "  ┌─────────────────────────────────────────┐"
  echo "  │         BLACKHILL CONTROL CENTER          │"
  echo "  │            Own the machine.               │"
  echo "  └─────────────────────────────────────────┘"
  echo -e "${NC}"
}

status_line() {
  local label="$1"
  local value="$2"
  local ok="$3"
  if [[ "$ok" == "ok" ]]; then
    printf "  ${GREEN}●${NC} %-18s %s\n" "$label" "$value"
  elif [[ "$ok" == "warn" ]]; then
    printf "  ${YELLOW}●${NC} %-18s %s\n" "$label" "$value"
  else
    printf "  ${RED}●${NC} %-18s %s\n" "$label" "$value"
  fi
}

security_overview() {
  print_header
  echo -e "  ${BOLD}Security Overview${NC}"
  echo "  ────────────────────────────────────────"
  echo

  # Firewall
  if systemctl is-active --quiet nftables 2>/dev/null; then
    status_line "Firewall" "nftables active" ok
  elif command -v nft &>/dev/null && nft list ruleset 2>/dev/null | grep -q .; then
    status_line "Firewall" "rules present (service state unknown)" warn
  else
    status_line "Firewall" "inactive / not configured" fail
  fi

  # AppArmor
  if command -v aa-status &>/dev/null && aa-status --enabled &>/dev/null 2>&1; then
    local profiles
    profiles=$(aa-status 2>/dev/null | grep -c "profiles are in enforce mode" || echo 0)
    status_line "AppArmor" "enabled" ok
  else
    status_line "AppArmor" "not active" warn
  fi

  # Kernel
  status_line "Kernel" "$(uname -r)" ok

  # Secure Boot (best-effort)
  if [[ -d /sys/firmware/efi ]]; then
    if mokutil --sb-state 2>/dev/null | grep -qi enabled; then
      status_line "Secure Boot" "enabled" ok
    else
      status_line "Secure Boot" "disabled or unavailable" warn
    fi
  else
    status_line "Secure Boot" "not EFI" warn
  fi

  # Snapper
  if command -v snapper &>/dev/null; then
    local count
    count=$(snapper list 2>/dev/null | tail -n +3 | wc -l || echo 0)
    status_line "Snapshots" "${count} listed" ok
  else
    status_line "Snapshots" "snapper not installed" warn
  fi

  # User
  if [[ $EUID -eq 0 ]]; then
    status_line "Session" "root" warn
  else
    status_line "Session" "$(whoami)" ok
  fi

  echo
  read -rp "  Press Enter to return..."
}

firewall_menu() {
  while true; do
    print_header
    echo -e "  ${BOLD}Firewall Control${NC}"
    echo "  ────────────────────────────────────────"
    echo "  1) Show current rules"
    echo "  2) Start nftables"
    echo "  3) Stop nftables"
    echo "  4) Enable on boot"
    echo "  5) Disable on boot"
    echo "  6) Back"
    echo
    read -rp "  Choice: " c
    case "$c" in
      1) sudo nft list ruleset 2>/dev/null | less ;;
      2) sudo systemctl start nftables && echo "  Started." && sleep 1 ;;
      3) sudo systemctl stop nftables && echo "  Stopped." && sleep 1 ;;
      4) sudo systemctl enable nftables && echo "  Enabled." && sleep 1 ;;
      5) sudo systemctl disable nftables && echo "  Disabled." && sleep 1 ;;
      6) return ;;
      *) ;;
    esac
  done
}

snapshot_menu() {
  print_header
  echo -e "  ${BOLD}Snapshots${NC}"
  echo "  ────────────────────────────────────────"
  if command -v snapper &>/dev/null; then
    snapper list 2>/dev/null || echo "  Unable to list snapshots."
    echo
    echo "  1) Create checkpoint now"
    echo "  2) Back"
    read -rp "  Choice: " c
    if [[ "$c" == "1" ]]; then
      sudo snapper -c root create -d "BLACKHILL manual checkpoint $(date +%F_%T)" && echo "  Created."
      sleep 1
    fi
  else
    echo "  snapper is not installed."
    echo "  Run: sudo ./scripts/setup-btrfs-snapper.sh"
    read -rp "  Press Enter..."
  fi
}

audit_menu() {
  print_header
  echo -e "  ${BOLD}Audit${NC}"
  echo "  ────────────────────────────────────────"
  local script
  script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lynis-baseline.sh"
  if [[ -x "$script" ]]; then
    echo "  Running Lynis baseline (requires root)..."
    sudo "$script"
  else
    echo "  lynis-baseline.sh not found or not executable."
  fi
  read -rp "  Press Enter..."
}

main_menu() {
  while true; do
    print_header
    echo "  1) Security overview"
    echo "  2) Firewall control"
    echo "  3) Snapshots"
    echo "  4) Run Lynis audit"
    echo "  5) Lock screen"
    echo "  6) Exit"
    echo
    read -rp "  Select: " choice
    case "$choice" in
      1) security_overview ;;
      2) firewall_menu ;;
      3) snapshot_menu ;;
      4) audit_menu ;;
      5) command -v hyprlock >/dev/null && hyprlock || echo "  hyprlock not found" ;;
      6) echo -e "\n  ${RED}BLACKHILL${NC} — Own the machine.\n"; exit 0 ;;
      *) ;;
    esac
  done
}

main_menu
