# BLACKHILL Performance Guide — No Lag

Goal: keep the premium dark look while staying fast on real hardware.

## Defaults already tuned

The main Hyprland config now uses:

- Lighter blur (1 pass, small size)
- Smaller shadows
- Faster animations
- Full opacity (no transparency tax)
- VFR enabled

## Instant max-speed mode

If you feel any lag:

```bash
# Copy the performance profile
cp configs/hypr/hyprland-performance.conf ~/.config/hypr/

# Add this line at the bottom of ~/.config/hypr/hyprland.conf:
# source = ~/.config/hypr/hyprland-performance.conf

# Reload
hyprctl reload
```

This disables blur, shadows, and animations for maximum responsiveness.

## System-level tips

### 1. Use the right kernel for your goal
- **Security priority:** `linux-hardened`
- **Speed / gaming / laptop balance:** `linux-zen` or `linux`

You can keep BLACKHILL hardening sysctls with either kernel.

### 2. GPU drivers
```bash
# AMD
sudo pacman -S mesa vulkan-radeon libva-mesa-driver

# Intel
sudo pacman -S mesa vulkan-intel intel-media-driver

# NVIDIA
sudo pacman -S nvidia nvidia-utils  # or nvidia-open as appropriate
```

### 3. Optional performance sysctl
```bash
sudo cp configs/sysctl/99-blackhill-performance.conf /etc/sysctl.d/
sudo sysctl --system
```

### 4. Reduce background work
- Avoid running heavy Electron apps unnecessarily
- Prefer `mpv` over heavier players (already default)
- Keep Waybar modules minimal (current config is already light)

### 5. Power profiles (laptops)
```bash
sudo pacman -S power-profiles-daemon
powerprofilesctl set performance   # when plugged in
```

## Quick checklist if something feels laggy

1. Source `hyprland-performance.conf` (kills blur/animations)
2. Confirm correct GPU driver is in use (`glxinfo -B` or `vulkaninfo`)
3. Check CPU frequency governor / power profile
4. Close unused browsers / Electron apps
5. Ensure swap is not thrashing (`free -h`, consider more RAM or lower swappiness)

## Philosophy

BLACKHILL should feel like a precision instrument: secure by default, fast when you need it, and never sluggish because of decorative effects.
