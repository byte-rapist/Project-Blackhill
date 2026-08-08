# BLACKHILL Installation Guide

Turn a clean Arch Linux system into BLACKHILL.

> Video playback and performance-oriented desktop defaults are included.

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
# Security-focused:
sudo pacman -S linux-hardened linux-hardened-headers

# Or speed-focused (still use BLACKHILL sysctl hardening):
# sudo pacman -S linux-zen linux-zen-headers
```

Apply parameters from `configs/kernel/cmdline-recommended.txt` as needed.

## 4. Desktop + video

```bash
cd packages/blackhill-base && makepkg -si
cd ../blackhill-desktop && makepkg -si
```

Or install packages manually (see packages/README.md and docs/MEDIA.md).

## 5. First-boot

```bash
chmod +x scripts/first-boot.sh themes/blackhill-dark/install-theme.sh
./scripts/first-boot.sh
```

## 6. Performance (recommended on every machine)

```bash
chmod +x scripts/enable-performance-mode.sh
./scripts/enable-performance-mode.sh   # optional max-speed profile
```

Read **[docs/PERFORMANCE.md](PERFORMANCE.md)** for GPU drivers, sysctl, and lag fixes.

## 7. Branding

```bash
sudo cp branding/os-release /etc/os-release
sudo cp branding/motd /etc/motd
```

## 8. Reboot

```bash
reboot
```

Then verify: Hyprland feels snappy, `mpv` plays video, `lynis audit system` runs cleanly enough for your threat model.
