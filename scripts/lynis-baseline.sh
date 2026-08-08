#!/usr/bin/env bash
# BLACKHILL Lynis baseline helper
# Runs a Lynis audit and stores results under /var/log/blackhill/

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run as root for a full system audit."
  exit 1
fi

if ! command -v lynis >/dev/null 2>&1; then
  echo "Installing lynis..."
  pacman -S --needed --noconfirm lynis
fi

mkdir -p /var/log/blackhill
STAMP=$(date +%Y%m%d_%H%M%S)
REPORT="/var/log/blackhill/lynis-${STAMP}.log"

echo "=============================================="
echo "  BLACKHILL Lynis Baseline Audit"
echo "=============================================="
echo "Report will be saved to: ${REPORT}"
echo

lynis audit system --report-file "${REPORT}" | tee "/var/log/blackhill/lynis-${STAMP}-console.log"

echo
echo "Audit complete."
echo "Review the report and address warnings relevant to your threat model."
echo "Note: some findings are expected on a rolling, root-capable operator system."
echo
echo "BLACKHILL — Own the machine."
