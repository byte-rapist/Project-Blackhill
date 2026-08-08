# Phase 4 — Distribution (Substantially Complete)

## Delivered

| Component | Location | Status |
|-----------|----------|--------|
| Archiso profile structure | `iso/profile/` | Complete skeleton |
| profiledef.sh | `iso/profile/profiledef.sh` | Done |
| packages.x86_64 | `iso/profile/packages.x86_64` | Done (live + desktop + security) |
| pacman.conf | `iso/profile/pacman.conf` | Done |
| airootfs branding | `iso/profile/airootfs/etc/` | os-release + MOTD |
| Live installer | `iso/profile/airootfs/usr/local/bin/blackhill-install` | Guided helper |
| Build documentation | `docs/ISO-BUILD.md` | Done |
| Signing guidance | `docs/ISO-SIGNING.md` | Done |
| ISO README | `iso/README.md` | Done |

## What still requires a real Arch host

- Actually running `mkarchiso` and producing the `.iso` file
- Boot testing (VM + hardware)
- Iterating on any missing firmware / drivers discovered in testing
- Publishing signed releases (Phase 5)

## Build command (on Arch)

```bash
cd iso
sudo mkarchiso -v -w work -o out profile
```

Phase 4 blueprint and all supporting files are complete. The remaining work is execution and testing on a real build machine.
