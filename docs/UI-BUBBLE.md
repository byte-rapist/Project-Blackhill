# BLACKHILL Bubble Glass UI

Windows and panels use a soft **bubble / frosted glass** style inspired by modern iOS and Windows acrylic design.

## What you get

- **Rounding:** ~20px corners (24px on floating windows) — soft bubble shape
- **Blur:** Heavy frosted glass (size 8, 3 passes) behind transparent windows
- **Shadows:** Deep, soft drop shadows with offset for a floating-card look
- **Opacity:** Active ~92%, inactive ~82% for real glass depth
- **Waybar / Rofi:** Pill-shaped modules and rounded launcher
- **Lock screen:** Matching frosted bubble input field

## Apply

```bash
cp configs/hypr/hyprland.conf ~/.config/hypr/
cp configs/hypr/hyprlock.conf ~/.config/hypr/
cp themes/blackhill-dark/waybar/style.css ~/.config/waybar/
cp themes/blackhill-dark/rofi/blackhill.rasi ~/.config/rofi/
cp configs/kitty/kitty.conf ~/.config/kitty/
hyprctl reload
```

## Performance note

Bubble glass uses more GPU than the flat performance profile.

If you notice lag:

```bash
./scripts/enable-performance-mode.sh
```

That switches to the no-blur / no-shadow fast profile while keeping BLACKHILL colors.

You can also lower blur in `hyprland.conf`:

```
blur {
    size = 4
    passes = 2
}
```

## Design language

Matte black base + deep crimson accents + **soft geometry** + **real depth**.
Not neon cyberpunk — premium glass operator UI.
