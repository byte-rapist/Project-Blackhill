# BLACKHILL ISO — Phase 4

This directory contains a complete Archiso profile skeleton for building a BLACKHILL live / install medium.

## Requirements

- Arch Linux host
- `archiso` package
- Sufficient disk space (~10GB+ free recommended)
- Root privileges for the build

```bash
sudo pacman -S archiso
```

## Quick build

```bash
cd iso
cp -r profile work-profile   # optional working copy
sudo mkarchiso -v -w work -o out profile
```

The resulting ISO will appear under `iso/out/`.

## What the profile includes

- BLACKHILL branding (`os-release`, MOTD)
- Hardening configs (sysctl, nftables)
- Desktop packages (Hyprland stack)
- Live installer script (`blackhill-install`)
- First-boot and theme hooks

## Custom installer

On the live system:

```bash
sudo blackhill-install
```

Or follow the manual path in the main project docs.

## Signing

See `docs/ISO-SIGNING.md` for release signing and Secure Boot notes.

## Important

Building a fully tested, production-quality ISO still requires:

1. Running `mkarchiso` on a real Arch host
2. Testing boot in VMs and on hardware
3. Iterating on package list and startup services
4. Optional: publishing checksums and signatures

The profile in this repository is the complete blueprint for that process.
