#!/usr/bin/env bash
# BLACKHILL Dark Theme Installer
set -euo pipefail

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USER_HOME="${HOME}"

echo "=== BLACKHILL Dark Theme Installer ==="

# Icons
echo "[+] Installing icon theme..."
mkdir -p "${USER_HOME}/.local/share/icons"
rm -rf "${USER_HOME}/.local/share/icons/Blackhill"
cp -r "${THEME_DIR}/icons/Blackhill" "${USER_HOME}/.local/share/icons/"
gtk-update-icon-cache "${USER_HOME}/.local/share/icons/Blackhill" 2>/dev/null || true

# GTK
echo "[+] Installing GTK theme..."
mkdir -p "${USER_HOME}/.themes/Blackhill-Dark"
cp -r "${THEME_DIR}/gtk-3.0" "${USER_HOME}/.themes/Blackhill-Dark/"
cp -r "${THEME_DIR}/gtk-4.0" "${USER_HOME}/.themes/Blackhill-Dark/" 2>/dev/null || true

# Waybar & Rofi
echo "[+] Installing Waybar and Rofi..."
mkdir -p "${USER_HOME}/.config/waybar" "${USER_HOME}/.config/rofi"
cp "${THEME_DIR}/waybar/style.css" "${USER_HOME}/.config/waybar/" 2>/dev/null || true
cp "${THEME_DIR}/rofi/blackhill.rasi" "${USER_HOME}/.config/rofi/" 2>/dev/null || true

echo
echo "=== Installation complete ==="
echo "Apply with:"
echo "  gsettings set org.gnome.desktop.interface gtk-theme 'Blackhill-Dark'"
echo "  gsettings set org.gnome.desktop.interface icon-theme 'Blackhill'"
echo
echo "BLACKHILL — Own the machine."
