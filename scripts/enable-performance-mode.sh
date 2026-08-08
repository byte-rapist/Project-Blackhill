#!/usr/bin/env bash
# BLACKHILL — enable maximum performance Hyprland profile

set -euo pipefail

HYPR_DIR="${HOME}/.config/hypr"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${REPO_ROOT}/configs/hypr/hyprland-performance.conf"
DST="${HYPR_DIR}/hyprland-performance.conf"
MAIN="${HYPR_DIR}/hyprland.conf"

mkdir -p "${HYPR_DIR}"
cp "${SRC}" "${DST}"

if [[ -f "${MAIN}" ]]; then
  if ! grep -q "hyprland-performance.conf" "${MAIN}"; then
    echo "" >> "${MAIN}"
    echo "# BLACKHILL performance profile" >> "${MAIN}"
    echo "source = ~/.config/hypr/hyprland-performance.conf" >> "${MAIN}"
    echo "[+] Performance profile sourced in hyprland.conf"
  else
    echo "[+] Performance profile already referenced"
  fi
else
  echo "[!] ~/.config/hypr/hyprland.conf not found. Copy main config first."
fi

if command -v hyprctl &>/dev/null; then
  hyprctl reload 2>/dev/null || true
  echo "[+] Hyprland reloaded (if running)"
fi

echo
echo "Performance mode enabled: blur, shadows, animations reduced/disabled."
echo "BLACKHILL — Own the machine."
