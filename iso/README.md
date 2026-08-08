# BLACKHILL ISO Build Instructions

Building a custom live ISO requires an Arch Linux host with the `archiso` package installed.

## Steps (high level)

1. Install archiso:
   ```bash
   sudo pacman -S archiso
   ```

2. Copy the official releng profile as a starting point:
   ```bash
   cp -r /usr/share/archiso/configs/releng ./profile
   ```

3. Customize:
   - Edit `profile/packages.x86_64` — add blackhill packages, hyprland, security tools, etc.
   - Place branding files into `profile/airootfs/etc/` (os-release, motd, issue, etc.)
   - Add the hardening configs and scripts into the airootfs.
   - Modify bootloader branding.

4. Build:
   ```bash
   sudo mkarchiso -v -w work -o out ./profile
   ```

5. Test the resulting ISO in a VM before writing to USB.

## Current state of this repository

The recommended path today is:

1. Install plain Arch.
2. Apply the scripts and configs from this repository.
3. Install Hyprland + the blackhill-dark theme.
4. Install desired tools from the package list (or enable BlackArch repo).

This gives you a functional BLACKHILL system without waiting for a full ISO.
