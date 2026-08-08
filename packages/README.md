# BLACKHILL Packages

## Meta-packages

| Package | Purpose |
|---------|--------|
| `blackhill-base` | Core hardening dependencies |
| `blackhill-desktop` | Hyprland + theme stack + **video playback (mpv, ffmpeg, codecs)** |
| `blackhill-offensive` | Curated offensive tools |
| `blackhill-defensive` | Blue-team / audit tools |
| `blackhill-full` | Everything |

## Video support (included in blackhill-desktop)

- **Player:** `mpv` (best Wayland/Hyprland experience)
- **Engine:** `ffmpeg`
- **Streaming helper:** `yt-dlp`
- **GStreamer plugins:** full set for broad format support
- **Hardware decode:** install the matching optdepend for your GPU:
  - Intel → `intel-media-driver`
  - AMD → `libva-mesa-driver`
  - NVIDIA → `libva-nvidia-driver` (where applicable)

```bash
mpv video.mp4
mpv https://youtu.be/...
```

## Build & install

```bash
cd packages/blackhill-base && makepkg -si
cd ../blackhill-desktop && makepkg -si
# optional tool sets or:
cd ../blackhill-full && makepkg -si
```

Still run the repo hardening and theme scripts for the full BLACKHILL experience.
