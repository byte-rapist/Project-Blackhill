#!/usr/bin/env bash
# BLACKHILL Btrfs + Snapper helper
# Run as root on a Btrfs root filesystem.
# This is a helper, not a full automatic installer — review before use.

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run as root."
  exit 1
fi

echo "=============================================="
echo "  BLACKHILL Btrfs + Snapper Helper"
echo "=============================================="
echo

if ! findmnt -t btrfs / >/dev/null 2>&1; then
  echo "[!] Root filesystem does not appear to be Btrfs. Aborting."
  exit 1
fi

echo "[+] Installing snapper and related tools..."
pacman -S --needed --noconfirm snapper snap-pac grit 2>/dev/null || \
pacman -S --needed --noconfirm snapper snap-pac

if [[ ! -f /etc/snapper/configs/root ]]; then
  echo "[+] Creating snapper config for root..."
  snapper -c root create-config /
else
  echo "[+] Snapper root config already exists."
fi

# Reasonable defaults
echo "[+] Setting timeline and cleanup defaults..."
sed -i 's/^TIMELINE_CREATE=.*/TIMELINE_CREATE="yes"/' /etc/snapper/configs/root 2>/dev/null || true
sed -i 's/^TIMELINE_CLEANUP=.*/TIMELINE_CLEANUP="yes"/' /etc/snapper/configs/root 2>/dev/null || true
sed -i 's/^NUMBER_LIMIT=.*/NUMBER_LIMIT="20"/' /etc/snapper/configs/root 2>/dev/null || true
sed -i 's/^NUMBER_LIMIT_IMPORTANT=.*/NUMBER_LIMIT_IMPORTANT="5"/' /etc/snapper/configs/root 2>/dev/null || true

systemctl enable --now snapper-timeline.timer 2>/dev/null || true
systemctl enable --now snapper-cleanup.timer 2>/dev/null || true

echo
echo "Snapper configured for root."
echo "Useful commands:"
echo "  snapper list"
echo "  snapper create -d 'manual checkpoint'"
echo "  snapper rollback <number>"
echo
echo "Consider also creating a config for /home if it is a separate Btrfs subvolume."
echo "BLACKHILL — Own the machine."
