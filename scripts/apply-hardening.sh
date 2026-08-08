#!/usr/bin/env bash
# BLACKHILL Hardening Applicator
# Version: 0.1.0-foundation
# Run as root on a fresh or existing Arch Linux system.
# Review every change before applying in production.

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "[ERROR] This script must be run as root."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "=============================================="
echo "  BLACKHILL Hardening Script"
echo "  Version: 0.1.0-foundation"
echo "=============================================="
echo "Repository: ${REPO_ROOT}"
echo

# 1. Sysctl
if [[ -f "${REPO_ROOT}/configs/sysctl/99-blackhill-hardening.conf" ]]; then
  echo "[+] Installing sysctl hardening profile..."
  install -Dm644 "${REPO_ROOT}/configs/sysctl/99-blackhill-hardening.conf" \
    /etc/sysctl.d/99-blackhill-hardening.conf
  sysctl --system >/dev/null 2>&1 || true
  echo "    Installed → /etc/sysctl.d/99-blackhill-hardening.conf"
else
  echo "[!] sysctl profile not found, skipping."
fi

# 2. nftables
if command -v nft >/dev/null 2>&1; then
  if [[ -f "${REPO_ROOT}/configs/nftables/blackhill.nft" ]]; then
    echo "[+] Installing nftables ruleset..."
    install -Dm644 "${REPO_ROOT}/configs/nftables/blackhill.nft" /etc/nftables.conf
    systemctl enable nftables >/dev/null 2>&1 || true
    echo "    Installed → /etc/nftables.conf"
    echo "    Review the rules, then: systemctl start nftables"
  fi
else
  echo "[!] nftables not installed. Skipping firewall rules."
fi

# 3. SSH guidance
if [[ -f /etc/ssh/sshd_config ]]; then
  echo "[+] SSH hardening recommendations:"
  cat <<EOF
    Edit /etc/ssh/sshd_config (suggested):
      PermitRootLogin no
      PasswordAuthentication no
      PubkeyAuthentication yes
      MaxAuthTries 3
      ClientAliveInterval 300
      X11Forwarding no
      AllowTcpForwarding no
EOF
fi

# 4. Recommended packages
if command -v pacman >/dev/null 2>&1; then
  echo "[+] Ensuring core security packages are present..."
  pacman -S --needed --noconfirm \
    linux-hardened linux-hardened-headers \
    apparmor nftables \
    firejail bubblewrap \
    lynis aide fail2ban \
    wireguard-tools \
    2>/dev/null || echo "    Some packages could not be installed (check mirrors / conflicts)."
fi

# 5. AppArmor
if pacman -Q apparmor &>/dev/null 2>&1; then
  echo "[+] Enabling AppArmor service..."
  systemctl enable apparmor >/dev/null 2>&1 || true
  echo "    Ensure kernel cmdline includes:"
  echo "      apparmor=1 lsm=landlock,lockdown,yama,apparmor"
fi

echo
echo "=============================================="
echo "  Hardening application finished"
echo "=============================================="
echo
echo "Next recommended steps:"
echo "  1. Review /etc/sysctl.d/99-blackhill-hardening.conf"
echo "  2. Review /etc/nftables.conf and start nftables"
echo "  3. Configure kernel command line (hardened parameters)"
echo "  4. Set up LUKS2 + Btrfs + snapshots if not already done"
echo "  5. Install desktop theme: themes/blackhill-dark/install-theme.sh"
echo "  6. Reboot and run: lynis audit system"
echo
echo "Documentation: docs/INSTALL.md"
echo "BLACKHILL — Own the machine. Completely."
