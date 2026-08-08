# Phase 1 — Hardened Base

**Status: Substantially complete (pending real-world testing)**

## Delivered

| Component | Location | Description |
|-----------|----------|-------------|
| AppArmor profiles | `configs/apparmor/` | Firefox, Chromium, sshd, curl, git, nft, pacman skeletons + full workflow |
| USBGuard | `configs/usbguard/` | Improved baseline + generation guidance |
| Btrfs + Snapper | `scripts/setup-btrfs-snapper.sh` | Timeline, cleanup, initial checkpoint, grub-btrfs note |
| Lynis baseline | `scripts/lynis-baseline.sh` | Audit runner with timestamped reports |
| Secure Boot | `docs/SECURE-BOOT.md` | Owner-controlled key enrollment path |

## How to apply everything in Phase 1

```bash
# 1. AppArmor
sudo pacman -S apparmor apparmor-utils
# Copy desired profiles from configs/apparmor/ to /etc/apparmor.d/
# Follow the workflow in configs/apparmor/README.md

# 2. USBGuard
sudo pacman -S usbguard
sudo cp configs/usbguard/usbguard.conf /etc/usbguard/
sudo usbguard generate-policy | sudo tee /etc/usbguard/rules.conf
sudo systemctl enable --now usbguard

# 3. Btrfs snapshots (only if root is Btrfs)
sudo ./scripts/setup-btrfs-snapper.sh

# 4. Audit baseline
sudo ./scripts/lynis-baseline.sh

# 5. Secure Boot
# Follow docs/SECURE-BOOT.md carefully with a recovery plan
```

## What remains

- Real hardware testing and profile tuning via `aa-logprof`
- Per-machine USBGuard rule finalization
- Optional bootable snapshot integration testing with grub-btrfs or systemd-boot alternatives

Phase 1 core deliverables are in the repository and ready for application and testing.
