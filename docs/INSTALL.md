# BLACKHILL Installation Guide

Turn a clean Arch Linux system into BLACKHILL.

> **Status**: Foundation + Phases 1–4 available. Video playback included in the desktop stack.

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

## 3. Kernel

```bash
sudo pacman -S linux-hardened linux-hardened-headers
```

Apply recommended parameters from `configs/kernel/cmdline-recommended.txt`.

## 4. Desktop + video stack

### Option A — Meta-packages (recommended)

```bash
cd packages/blackhill-base && makepkg -si
cd ../blackhill-desktop && makepkg -si
```

This pulls Hyprland, the UI stack, **mpv, ffmpeg, codecs**, and related tools.

### Option B — Manual

```bash
sudo pacman -S hyprland waybar kitty rofi thunar \
  xdg-desktop-portal-hyprland polkit-gnome \
  grim slurp wl-clipboard brightnessctl \
  hyprlock hypridle hyprpaper \
  mpv ffmpeg yt-dlp libva libva-utils \
  gst-libav gst-plugins-base gst-plugins-good \
  gst-plugins-bad gst-plugins-ugly
```

Add your GPU VA-API driver (see [MEDIA.md](MEDIA.md)).

## 5. First-boot (theme + configs)

```bash
chmod +x scripts/first-boot.sh themes/blackhill-dark/install-theme.sh
./scripts/first-boot.sh
```

## 6. Branding (as root)

```bash
sudo cp branding/os-release /etc/os-release
sudo cp branding/motd /etc/motd
```

## 7. Reboot and verify

```bash
reboot
# Log into Hyprland
mpv --version
lynis audit system
```

## Post-install

See [POST-INSTALL.md](POST-INSTALL.md) and [MEDIA.md](MEDIA.md).
