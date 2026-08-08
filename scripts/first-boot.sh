#!/usr/bin/env bash
# BLACKHILL First-Boot Helper
# Run once after applying hardening and installing the desktop.

set -euo pipefail

echo "=============================================="
echo "  BLACKHILL First-Boot Setup"
echo "=============================================="
echo

# Create standard directories
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/.config/hypr
mkdir -p ~/.local/share/icons
mkdir -p ~/.themes

echo "[+] Standard directories created"

# Remind about theme
if [[ -d "$(dirname "$0")/../themes/blackhill-dark" ]]; then
  echo "[+] Theme available. Run:"
  echo "    cd themes/blackhill-dark && ./install-theme.sh"
fi

# Basic system info
echo
echo "System summary:"
echo "  Kernel: $(uname -r)"
echo "  User:   $(whoami)"
echo
echo "Recommended next actions:"
echo "  1. Install and apply the Blackhill Dark theme"
echo "  2. Copy configs/hypr/* to ~/.config/hypr/"
echo "  3. Review kernel cmdline recommendations"
echo "  4. Run: lynis audit system"
echo "  5. Reboot and start Hyprland"
echo
echo "BLACKHILL — Own the machine."
