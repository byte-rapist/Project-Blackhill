# USBGuard — BLACKHILL Phase 1

## Quick setup

```bash
sudo pacman -S usbguard
sudo cp configs/usbguard/usbguard.conf /etc/usbguard/usbguard.conf
# Generate rules matched to YOUR currently connected devices:
sudo usbguard generate-policy | sudo tee /etc/usbguard/rules.conf
sudo systemctl enable --now usbguard
```

## Workflow for tightening

1. Start with `usbguard generate-policy` so your existing keyboard/mouse/storage work.
2. Review `/etc/usbguard/rules.conf` and remove anything you do not need.
3. Set `ImplicitPolicyTarget=block` (already in the provided config).
4. Test by plugging in unknown devices — they should be blocked until explicitly allowed.

## Useful commands

```bash
usbguard list-devices
usbguard allow-device <id>
usbguard block-device <id>
usbguard list-rules
```
