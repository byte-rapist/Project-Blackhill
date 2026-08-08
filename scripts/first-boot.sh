#!/usr/bin/env bash
# BLACKHILL First-Boot / Post-Install Wizard
# Version: 0.1.0-foundation
# Run after applying hardening and installing the desktop stack.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=============================================="
echo "  BLACKHILL First-Boot Setup"
echo "  Version 0.1.0-foundation"
echo "=============================================="
echo

# Directories
echo "[1/7] Creating standard directories..."
mkdir -p "${HOME}/Pictures/Screenshots"
mkdir -p "${HOME}/.config/hypr"
mkdir -p "${HOME}/.config/waybar"
mkdir -p "${HOME}/.config/kitty"
mkdir -p "${HOME}/.config/rofi"
mkdir -p "${HOME}/.local/share/icons"
mkdir -p "${HOME}/.themes"
echo "      Done."

# Hyprland configs
echo "[2/7] Installing Hyprland configuration set..."
if [[ -d "${REPO_ROOT}/configs/hypr" ]]; then
  cp -n "${REPO_ROOT}/configs/hypr/"*.conf "${HOME}/.config/hypr/" 2>/dev/null || \
  cp "${REPO_ROOT}/configs/hypr/"*.conf "${HOME}/.config/hypr/"
  echo "      Hyprland configs installed."
else
  echo "      Hyprland configs not found."
fi

# Theme
echo "[3/7] Installing Blackhill Dark theme..."
if [[ -x "${REPO_ROOT}/themes/blackhill-dark/install-theme.sh" ]]; then
  "${REPO_ROOT}/themes/blackhill-dark/install-theme.sh"
else
  echo "      Theme installer not found or not executable."
fi

# Waybar config
echo "[4/7] Installing Waybar config..."
if [[ -f "${REPO_ROOT}/configs/waybar/config" ]]; then
  cp "${REPO_ROOT}/configs/waybar/config" "${HOME}/.config/waybar/"
  echo "      Waybar config installed."
fi

# Kitty
echo "[5/7] Installing Kitty theme..."
if [[ -f "${REPO_ROOT}/configs/kitty/kitty.conf" ]]; then
  cp "${REPO_ROOT}/configs/kitty/kitty.conf" "${HOME}/.config/kitty/"
  echo "      Kitty theme installed."
fi

# Branding reminder
echo "[6/7] Branding files..."
echo "      System branding (os-release, motd) should be installed as root:"
echo "      sudo cp branding/os-release /etc/os-release"
echo "      sudo cp branding/motd /etc/motd"

# Final checklist
echo "[7/7] Final checklist"
cat <<EOF

==============================================
  BLACKHILL First-Boot Complete
==============================================

Next actions:

  1. Apply system branding (as root) if not done
  2. Review kernel cmdline: configs/kernel/cmdline-recommended.txt
  3. Enable and start nftables if desired
  4. Reboot
  5. Start Hyprland session
  6. Run: lynis audit system
  7. Optionally enable BlackArch for extended tooling

Documentation: docs/INSTALL.md

BLACKHILL — Own the machine. Completely.
EOF
