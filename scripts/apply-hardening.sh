#!/usr/bin/env bash
# BLACKHILL Hardening Applicator
# Run as root on a fresh or existing Arch system.
# This is a starting point — review every change.

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "=== BLACKHILL Hardening Script ==="
echo "Repository root: $REPO_ROOT"
echo

# 1. Sysctl
echo "[+] Installing sysctl hardening..."
install -Dm644 "$REPO_ROOT/configs/sysctl/99-blackhill-hardening.conf" /etc/sysctl.d/99-blackhill-hardening.conf
sysctl --system || true

# 2. nftables
echo "[+] Installing nftables ruleset..."
if command -v nft >/dev/null; then
  install -Dm644 "$REPO_ROOT/configs/nftables/blackhill.nft" /etc/nftables.conf
  systemctl enable nftables || true
  echo "    nftables rules installed. Review /etc/nftables.conf then: systemctl start nftables"
else
  echo "    nftables not installed. Skipping."
fi

# 3. Basic SSH hardening (if sshd present)
if [[ -f /etc/ssh/sshd_config ]]; then
  echo "[+] Applying conservative SSH hardening suggestions..."
  cat <<EOF
    Recommended sshd_config settings (edit manually):
      PermitRootLogin no          # or prohibit-password
      PasswordAuthentication no
      PubkeyAuthentication yes
      MaxAuthTries 3
      ClientAliveInterval 300
      X11Forwarding no
      AllowTcpForwarding no
EOF
fi

# 4. Install recommended packages if pacman is available
if command -v pacman >/dev/null; then
  echo "[+] Installing recommended base security packages..."
  pacman -S --needed --noconfirm \
    linux-hardened linux-hardened-headers \
    apparmor \
    nftables \
    firejail bubblewrap \
    lynis \
    aide \
    fail2ban \
    wireguard-tools \
    || echo "    Some packages failed or are already installed. Continuing."
fi

# 5. AppArmor
if command -v aa-status >/dev/null || pacman -Q apparmor &>/dev/null; then
  echo "[+] Enabling AppArmor..."
  systemctl enable apparmor || true
  echo "    Ensure kernel cmdline contains: apparmor=1 lsm=landlock,lockdown,yama,apparmor"
fi

echo
echo "=== Hardening application finished ==="
echo "Next steps:"
echo "  1. Review and adjust /etc/sysctl.d/99-blackhill-hardening.conf"
echo "  2. Review /etc/nftables.conf and start the service"
echo "  3. Set kernel command line (GRUB or systemd-boot) with recommended mitigations"
echo "  4. Configure full-disk encryption + Btrfs + snapper if not already done"
echo "  5. Install Hyprland theme from themes/blackhill-dark"
echo "  6. Reboot and run lynis audit"
echo
echo "BLACKHILL — Own the machine."
