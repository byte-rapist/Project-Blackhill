# Phase 1 — Hardened Base (Initiated)

Phase 1 focuses on deepening the security baseline beyond the foundation configs.

## Delivered in this phase initiation

| Item | Location | Notes |
|------|----------|-------|
| AppArmor profile skeletons | `configs/apparmor/` | Firefox, sshd skeletons + README workflow |
| USBGuard baseline | `configs/usbguard/` | Already present; use with `usbguard generate-policy` for real hardware |
| Btrfs + Snapper helper | `scripts/setup-btrfs-snapper.sh` | Creates root config and enables timers |
| Lynis baseline helper | `scripts/lynis-baseline.sh` | Runs audit and stores reports under `/var/log/blackhill/` |
| Secure Boot guidance | `docs/SECURE-BOOT.md` | Owner-controlled key enrollment path |

## How to apply Phase 1 pieces

```bash
# AppArmor
sudo pacman -S apparmor apparmor-utils
# copy and tune profiles from configs/apparmor/

# Btrfs snapshots (only if root is Btrfs)
sudo ./scripts/setup-btrfs-snapper.sh

# Audit baseline
sudo ./scripts/lynis-baseline.sh

# Secure Boot
# follow docs/SECURE-BOOT.md carefully
```

## Remaining Phase 1 work

- Real-world testing and refinement of AppArmor profiles
- Additional service profiles (e.g. common daemons)
- Tighter USBGuard rules generated from actual hardware
- Optional automation improvements for snapper + bootable snapshots

Phase 1 is now **initiated and partially delivered**. Further refinement happens through testing and contribution.
