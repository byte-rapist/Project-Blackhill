# BLACKHILL Cursor Theme

## Status

A full custom cursor theme requires binary cursor files (`.cursor` / Xcursor format) generated from source images. This directory provides the structure and guidance so a proper theme can be added.

## Recommended approach

1. Use an existing high-quality dark cursor theme as base (e.g. Bibata Modern Ice or Capitaine Dark) and recolour accents to `#C41E3A` / `#8B0000`.
2. Or generate with tools such as `xcursorgen` / `clickgen` from SVG/PNG sources.
3. Place the resulting theme in:
   ```
   ~/.local/share/icons/Blackhill-Cursors/
   ```
   with a proper `index.theme` and cursor files.

## Temporary recommendation

Until a full Blackhill cursor set is generated, use:

```bash
# Example
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
# or any dark cursor theme
```

Hyprland users can also set:

```
env = XCURSOR_THEME,Bibata-Modern-Classic
env = XCURSOR_SIZE,24
```

in `hyprland.conf`.

## Future

A native Blackhill cursor pack (matte black + crimson accent) is planned once source assets are produced.
