# BLACKHILL Installation Guide

Turn a clean Arch Linux system into BLACKHILL using this repository.

> **Status**: Foundation / pre-alpha (v0.1.0). Suitable for experienced Arch users.

## Prerequisites

- Working Arch Linux installation (UEFI recommended)
- Root / sudo access
- Internet connection

## 1. Clone

```bash
git clone https://github.com/byte-rapist/Project-Blackhill.git
cd Project-Blackhill
```

## 2. Apply hardening

```bash
sudo ./scripts/apply-hardening.sh
```

Review:
- `/etc/sysctl.d/99-blackhill-hardening.conf`
- `/etc/nftables.conf`

Optionally start the firewall:

```bash
sudo systemctl enable --now nftables
```

## 3. Kernel

```bash
sudo pacman -S linux-hardened linux-hardened-headers
```

Apply recommended parameters from `configs/kernel/cmdline-recommended.txt` via your bootloader, then rebuild the boot configuration.

## 4. Desktop stack

```bash
sudo pacman -S hyprland waybar kitty rofi thunar \
  xdg-desktop-portal-hyprland polkit-gnome \
  grim slurp wl-clipboard brightnessctl \
  hyprlock hypridle hyprpaper
```

## 5. First-boot setup (theme + configs)

```bash
chmod +x scripts/first-boot.sh themes/blackhill-dark/install-theme.sh
./scripts/first-boot.sh
```

This installs Hyprland configs, the full Blackhill Dark theme, Waybar, Kitty, and prints the remaining checklist.

## 6. Branding (as root)

```bash
sudo cp branding/os-release /etc/os-release
sudo cp branding/motd /etc/motd
```

## 7. Reboot and verify

```bash
reboot
# Log into Hyprland
lynis audit system
```

## 8. Post-install checklist

See **[docs/POST-INSTALL.md](POST-INSTALL.md)** for the full verification list.

## Optional: Extended tooling

- Review `packages/blackhill-tools.txt`
- Or enable the BlackArch repository for a very large security toolset, then keep the BLACKHILL hardening and theme layer on top.

## Troubleshooting

- **Theme not applying**: confirm files in `~/.themes` and `~/.local/share/icons`, then use nwg-look or gsettings.
- **Firewall too strict**: edit `/etc/nftables.conf` and reload.
- **AppArmor not active**: ensure kernel cmdline contains the LSM parameters and the service is enabled.

## Documentation Index

- [Architecture](ARCHITECTURE.md)
- [Hardening Rationale](HARDENING.md)
- [Post-Install Checklist](POST-INSTALL.md)
- [FAQ](FAQ.md)
- [Roadmap](ROADMAP.md)
