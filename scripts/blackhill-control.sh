#!/usr/bin/env bash
# BLACKHILL Lightweight Control Center (TUI)
# Simple operator control panel using fzf or basic select

set -euo pipefail

print_header() {
  clear
  echo "=============================================="
  echo "  BLACKHILL Control Center"
  echo "=============================================="
  echo
}

check_status() {
  echo "--- System Security Status ---"
  echo
  echo -n "Firewall (nftables): "
  if systemctl is-active --quiet nftables 2>/dev/null; then echo "ACTIVE"; else echo "inactive"; fi

  echo -n "AppArmor:            "
  if command -v aa-status &>/dev/null && aa-status --enabled &>/dev/null 2>&1; then echo "ENABLED"; else echo "not active"; fi

  echo -n "Kernel:              "
  uname -r

  echo -n "User:                "
  whoami

  echo
  if command -v snapper &>/dev/null; then
    echo "Snapper: installed"
    snapper list 2>/dev/null | head -5 || true
  else
    echo "Snapper: not installed"
  fi
  echo
}

firewall_menu() {
  echo "Firewall actions:"
  echo "  1) Show rules (nft list ruleset)"
  echo "  2) Start nftables"
  echo "  3) Stop nftables"
  echo "  4) Back"
  read -rp "Choice: " c
  case "$c" in
    1) sudo nft list ruleset | less ;;
    2) sudo systemctl start nftables && echo "Started" ;;
    3) sudo systemctl stop nftables && echo "Stopped" ;;
    *) ;;
  esac
}

main_menu() {
  while true; do
    print_header
    echo "  1) Security status overview"
    echo "  2) Firewall control"
    echo "  3) Run Lynis baseline audit"
    echo "  4) List snapper snapshots"
    echo "  5) Lock screen (hyprlock)"
    echo "  6) Exit"
    echo
    read -rp "Select: " choice
    case "$choice" in
      1) check_status; read -rp "Press Enter..." ;;
      2) firewall_menu ;;
      3) if [[ -x "$(dirname "$0")/lynis-baseline.sh" ]]; then sudo "$(dirname "$0")/lynis-baseline.sh"; else echo "lynis-baseline.sh not found"; fi; read -rp "Press Enter..." ;;
      4) snapper list 2>/dev/null || echo "snapper not available"; read -rp "Press Enter..." ;;
      5) command -v hyprlock >/dev/null && hyprlock || echo "hyprlock not found" ;;
      6) echo "BLACKHILL — Own the machine."; exit 0 ;;
      *) echo "Invalid option" ;;
    esac
  done
}

main_menu
