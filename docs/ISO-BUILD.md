# Building the BLACKHILL ISO

## Host requirements

- Arch Linux
- `archiso`
- Root access
- ~10–20 GB free space

```bash
sudo pacman -Syu archiso
```

## Build steps

```bash
cd /path/to/Project-Blackhill/iso

# Optional: work on a copy
cp -a profile my-blackhill-profile

# Build
sudo mkarchiso -v -w work -o out profile

# Result
ls -lh out/*.iso
```

## Testing

```bash
# QEMU example
qemu-system-x86_64 -m 4096 -boot d -cdrom out/blackhill-*.iso -enable-kvm
```

Also test on real hardware when possible (UEFI + Secure Boot scenarios).

## Customization points

| File / dir | Purpose |
|------------|--------|
| `profile/packages.x86_64` | Packages on the live image |
| `profile/profiledef.sh` | ISO name, label, boot modes |
| `profile/airootfs/` | Files injected into the live root |
| `profile/pacman.conf` | Pacman config used during build |

## Applying BLACKHILL after install

The live installer currently guides the user. The definitive path remains:

1. Install Arch (manually or via guided steps)
2. Clone this repository on the new system
3. Run hardening + first-boot scripts
4. Optionally install meta-packages from `packages/`

## Reproducibility notes

- Pin package versions or build from a clean bootstrap when aiming for reproducibility
- Record the exact commit hash of Project-Blackhill used in the build
- Publish SHA256 checksums with every ISO
