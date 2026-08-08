#!/usr/bin/env bash
# BLACKHILL Dark Theme Installer
# Version: 0.1.0-foundation

set -euo pipefail

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USER_HOME="${HOME}"

echo "=============================================="
echo "  BLACKHILL Dark Theme Installer"
echo "=============================================="
echo

# Icons
echo "[+] Installing icon theme..."
mkdir -p "${USER_HOME}/.local/share/icons"
rm -rf "${USER_HOME}/.local/share/icons/Blackhill"
cp -r "${THEME_DIR}/icons/Blackhill" "${USER_HOME}/.local/share/icons/"
gtk-update-icon-cache "${USER_HOME}/.local/share/icons/Blackhill" 2>/dev/null || true
echo "    → ~/.local/share/icons/Blackhill"

# GTK
echo "[+] Installing GTK theme..."
mkdir -p "${USER_HOME}/.themes/Blackhill-Dark"
cp -r "${THEME_DIR}/gtk-3.0" "${USER_HOME}/.themes/Blackhill-Dark/"
cp -r "${THEME_DIR}/gtk-4.0" "${USER_HOME}/.themes/Blackhill-Dark/" 2>/dev/null || true
echo "    → ~/.themes/Blackhill-Dark"

# Waybar
echo "[+] Installing Waybar style..."
mkdir -p "${USER_HOME}/.config/waybar"
if [[ -f "${THEME_DIR}/waybar/style.css" ]]; then
  cp "${THEME_DIR}/waybar/style.css" "${USER_HOME}/.config/waybar/"
fi
# Also copy config if available from main configs
if [[ -f "${THEME_DIR}/../../configs/waybar/config" ]]; then
  cp "${THEME_DIR}/../../configs/waybar/config" "${USER_HOME}/.config/waybar/" 2>/dev/null || true
fi
echo "    → ~/.config/waybar/"

# Rofi
echo "[+] Installing Rofi theme..."
mkdir -p "${USER_HOME}/.config/rofi"
if [[ -f "${THEME_DIR}/rofi/blackhill.rasi" ]]; then
  cp "${THEME_DIR}/rofi/blackhill.rasi" "${USER_HOME}/.config/rofi/"
fi
echo "    → ~/.config/rofi/blackhill.rasi"

# Kitty
if [[ -f "${THEME_DIR}/../../configs/kitty/kitty.conf" ]]; then
  echo "[+] Installing Kitty theme..."
  mkdir -p "${USER_HOME}/.config/kitty"
  cp "${THEME_DIR}/../../configs/kitty/kitty.conf" "${USER_HOME}/.config/kitty/"
  echo "    → ~/.config/kitty/kitty.conf"
fi

echo
echo "=============================================="
echo "  Theme installation complete"
echo "=============================================="
echo
echo "Apply themes with:"
echo "  gsettings set org.gnome.desktop.interface gtk-theme 'Blackhill-Dark'"
echo "  gsettings set org.gnome.desktop.interface icon-theme 'Blackhill'"
echo
echo "Or use nwg-look / lxappearance."
echo
echo "For Hyprland: copy configs/hypr/* to ~/.config/hypr/"
echo "For Rofi: rofi -show drun -theme blackhill"
echo
echo "BLACKHILL — Own the machine."
