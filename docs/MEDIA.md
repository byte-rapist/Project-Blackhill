# Video & Media on BLACKHILL

BLACKHILL supports full video playback out of the box when `blackhill-desktop` (or `blackhill-full`) is installed.

## Default stack

| Component | Package | Role |
|-----------|---------|------|
| Player | `mpv` | Fast, scriptable, excellent on Wayland/Hyprland |
| Decoder | `ffmpeg` | Core multimedia engine |
| Downloader | `yt-dlp` | YouTube and many other sites |
| GStreamer | `gst-plugins-*` + `gst-libav` | Broad format / app compatibility |
| VA-API | `libva` + `libva-utils` | Hardware acceleration framework |

## Hardware acceleration

Install the driver that matches your GPU:

```bash
# Intel
sudo pacman -S intel-media-driver

# AMD
sudo pacman -S libva-mesa-driver mesa

# NVIDIA (VA-API support varies by driver/generation)
sudo pacman -S libva-nvidia-driver
```

Verify:

```bash
vainfo
mpv --hwdec=auto video.mp4
```

## Usage examples

```bash
mpv movie.mkv
mpv --fs https://youtu.be/dQw4w9WgXcQ
mpv --audio-device=auto --hwdec=auto file.mp4
```

## Optional alternatives

```bash
sudo pacman -S vlc          # classic full-featured player
sudo pacman -S celluloid    # GTK frontend for mpv
```

## Live ISO

The ISO package list also includes `mpv` and `ffmpeg` so the live environment can play video for demos and recovery use cases.
