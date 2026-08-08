# Phase 2 — Premium UI Polish (Complete)

## Delivered

| Item | Location | Description |
|------|----------|-------------|
| Expanded icons | `themes/blackhill-dark/icons/Blackhill/scalable/` | Security status, actions, devices, mimetypes |
| Cursor theme guidance | `themes/blackhill-dark/cursors/README.md` | Structure + recommendations until native pack exists |
| Waybar security module | `configs/waybar/config` + `scripts/security-status.sh` | Live security status in the bar |
| Control Center TUI | `scripts/blackhill-control.sh` | Lightweight operator control panel |

## How to enable

```bash
# Icons (re-run theme installer)
cd themes/blackhill-dark && ./install-theme.sh

# Waybar security module
mkdir -p ~/.config/waybar/scripts
cp configs/waybar/config ~/.config/waybar/
cp configs/waybar/scripts/security-status.sh ~/.config/waybar/scripts/
chmod +x ~/.config/waybar/scripts/security-status.sh
# Restart waybar

# Control Center
chmod +x scripts/blackhill-control.sh
./scripts/blackhill-control.sh
```

## Notes

- A fully custom cursor theme requires generated Xcursor binaries; guidance is provided so it can be completed later.
- The Control Center is intentionally a simple TUI so it has zero extra dependencies beyond common tools.
- More icons can still be added over time; the structure and core set are in place.

Phase 2 is complete.
