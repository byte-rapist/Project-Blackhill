# Phase 3 — Packaging (Complete)

## Delivered

| Item | Location |
|------|----------|
| `blackhill-base` PKGBUILD | `packages/blackhill-base/` |
| `blackhill-desktop` PKGBUILD | `packages/blackhill-desktop/` |
| `blackhill-offensive` PKGBUILD | `packages/blackhill-offensive/` |
| `blackhill-defensive` PKGBUILD | `packages/blackhill-defensive/` |
| `blackhill-full` PKGBUILD | `packages/blackhill-full/` |
| Packaging README | `packages/README.md` |
| BlackArch integration guide | `docs/BLACKARCH.md` |

## How to use

```bash
cd packages/blackhill-base && makepkg -si
cd ../blackhill-desktop && makepkg -si

# Optional tool sets
cd ../blackhill-offensive && makepkg -si
cd ../blackhill-defensive && makepkg -si
# or everything:
cd ../blackhill-full && makepkg -si
```

Then still apply repository scripts for full hardening and theme:

```bash
sudo ./scripts/apply-hardening.sh
./scripts/first-boot.sh
```

For maximum tooling, enable BlackArch (see `docs/BLACKARCH.md`) and install categories selectively.

Phase 3 is complete.
