# BLACKHILL Packages — Phase 3

## Meta-packages

| Package | Purpose |
|---------|--------|
| `blackhill-base` | Core hardening dependencies + branding helpers |
| `blackhill-desktop` | Hyprland + theme stack + UI components |
| `blackhill-offensive` | Curated offensive / red-team oriented tools |
| `blackhill-defensive` | Blue-team / defensive / audit tools |
| `blackhill-full` | Everything above |

These are **meta-packages** (they pull in dependencies). They are intended to be built with `makepkg` on an Arch system and installed locally, or later published to a custom repository.

## Build & install (local)

```bash
cd packages/blackhill-base
makepkg -si

cd ../blackhill-desktop
makepkg -si

# Optional:
cd ../blackhill-offensive && makepkg -si
cd ../blackhill-defensive && makepkg -si
# or
cd ../blackhill-full && makepkg -si
```

## Notes

- Some tools live in the AUR or BlackArch. The PKGBUILDs prefer official repos where possible and document optional extras.
- After installing `blackhill-base` / `blackhill-desktop`, still run the hardening and theme scripts from this repository for full effect.
- For the largest tool collection, enable BlackArch (see `docs/BLACKARCH.md`) and then layer BLACKHILL hardening + desktop on top.
