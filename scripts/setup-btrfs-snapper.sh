#!/usr/bin/env bash
# BLACKHILL Btrfs + Snapper helper (Phase 1 enhanced)
# Run as root on a Btrfs root filesystem.

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run as root."
  exit 1
fi

echo "=============================================="
echo "  BLACKHILL Btrfs + Snapper Setup"
echo "=============================================="
echo

if ! findmnt -t btrfs / >/dev/null 2>&1; then
  echo "[!] Root does not appear to be Btrfs. Aborting."
  exit 1
fi

echo "[+] Installing snapper and helpers..."
pacman -S --needed --noconfirm snapper snap-pac 2>/dev/null || true

# Optional bootable snapshot support
if pacman -Ss grub-btrfs &>/dev/null; then
  pacman -S --needed --noconfirm grub-btrfs 2>/dev/null || true
fi

if [[ ! -f /etc/snapper/configs/root ]]; then
  echo "[+] Creating snapper config for / ..."
  snapper -c root create-config /
else
  echo "[+] Snapper root config already exists."
fi

echo "[+] Applying recommended timeline and cleanup settings..."
CONF=/etc/snapper/configs/root
if [[ -f "$CONF" ]]; then
  sed -i 's/^TIMELINE_CREATE=.*/TIMELINE_CREATE="yes"/' "$CONF" || true
  sed -i 's/^TIMELINE_CLEANUP=.*/TIMELINE_CLEANUP="yes"/' "$CONF" || true
  sed -i 's/^TIMELINE_LIMIT_HOURLY=.*/TIMELINE_LIMIT_HOURLY="5"/' "$CONF" || true
  sed -i 's/^TIMELINE_LIMIT_DAILY=.*/TIMELINE_LIMIT_DAILY="7"/' "$CONF" || true
  sed -i 's/^TIMELINE_LIMIT_WEEKLY=.*/TIMELINE_LIMIT_WEEKLY="4"/' "$CONF" || true
  sed -i 's/^TIMELINE_LIMIT_MONTHLY=.*/TIMELINE_LIMIT_MONTHLY="3"/' "$CONF" || true
  sed -i 's/^NUMBER_LIMIT=.*/NUMBER_LIMIT="20"/' "$CONF" || true
  sed -i 's/^NUMBER_LIMIT_IMPORTANT=.*/NUMBER_LIMIT_IMPORTANT="5"/' "$CONF" || true
fi

systemctl enable --now snapper-timeline.timer 2>/dev/null || true
systemctl enable --now snapper-cleanup.timer 2>/dev/null || true

# Create an initial checkpoint
snapper -c root create -d "BLACKHILL initial checkpoint" 2>/dev/null || true

echo
echo "Snapper configured."
echo "Useful commands:"
echo "  snapper list"
echo "  snapper create -d 'before upgrade'"
echo "  snapper rollback <number>"
echo
if command -v grub-mkconfig >/dev/null && pacman -Q grub-btrfs &>/dev/null; then
  echo "grub-btrfs is available — bootable snapshots can appear in GRUB after:"
  echo "  sudo grub-mkconfig -o /boot/grub/grub.cfg"
fi
echo
echo "BLACKHILL — Own the machine."
