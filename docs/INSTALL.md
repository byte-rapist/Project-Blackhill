# BLACKHILL Installation Guide

This guide describes how to turn a clean Arch Linux installation into a BLACKHILL system using the configurations and scripts in this repository.

> **Status**: Foundation / pre-alpha. Suitable for experienced Arch users and developers.

## Prerequisites

- A working Arch Linux installation (UEFI recommended)
- Root / sudo access
- Internet connection
- Basic familiarity with pacman and system configuration

## 1. Clone the repository

```bash
git clone https://github.com/byte-rapist/Project-Blackhill.git
cd Project-Blackhill
```

## 2. Apply base hardening

```bash
sudo ./scripts/apply-hardening.sh
```

Review the changes:

- `/etc/sysctl.d/99-blackhill-hardening.conf`
- `/etc/nftables.conf` (if installed)

Then start the firewall if desired:

```bash
sudo systemctl enable --now nftables
```

## 3. Kernel recommendations

Prefer the hardened kernel:

```bash
sudo pacman -S linux-hardened linux-hardened-headers
```

Add recommended kernel parameters (via `/etc/default/grub` or systemd-boot entries), for example:

```
apparmor=1 lsm=landlock,lockdown,yama,apparmor lockdown=integrity
init_on_alloc=1 init_on_free=1 page_alloc.shuffle=1
spectre_v2=on spec_store_bypass_disable=on
```

Rebuild bootloader config afterwards.

## 4. Desktop (Hyprland + BLACKHILL theme)

Install the stack:

```bash
sudo pacman -S hyprland waybar kitty rofi thunar \
  xdg-desktop-portal-hyprland polkit-gnome \
  grim slurp wl-clipboard brightnessctl
```

Install the theme:

```bash
cd themes/blackhill-dark
./install-theme.sh
```

Copy or symlink the Hyprland configuration:

```bash
mkdir -p ~/.config/hypr
cp ../../configs/hypr/hyprland.conf ~/.config/hypr/
```

Set GTK and icon themes (using nwg-look, lxappearance, or gsettings):

```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Blackhill-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Blackhill'
```

Log out and start a Hyprland session.

## 5. Security tools (optional)

See `packages/blackhill-tools.txt` for a recommended list.

You may also enable the [BlackArch](https://blackarch.org) repository for a very large curated set of security tools, then apply BLACKHILL hardening and theming on top.

## 6. Encryption & snapshots (strongly recommended)

- Full-disk encryption with LUKS2
- Btrfs with snapper (or timeshift) for root and home

These should ideally be configured at install time.

## 7. Verification

```bash
lynis audit system
sysctl -a | grep -E 'kptr_restrict|yama|dmesg_restrict'
nft list ruleset
```

## Troubleshooting

- If AppArmor is not enforcing, ensure the kernel command line contains the LSM parameters and that the `apparmor` service is enabled.
- If the firewall blocks needed traffic, edit `/etc/nftables.conf` and reload.
- Theme not applying: confirm the files are in `~/.themes` and `~/.local/share/icons` and that the desktop portal / settings daemon is running.

## Next Steps

- Read `docs/ARCHITECTURE.md`
- Review `docs/ROADMAP.md`
- Contribute improvements via Pull Requests
