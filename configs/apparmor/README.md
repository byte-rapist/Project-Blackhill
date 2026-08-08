# AppArmor Profiles — BLACKHILL Phase 1

## Profiles included

| Profile | Target | Notes |
|---------|--------|-------|
| `usr.bin.firefox` | Firefox | Browser skeleton |
| `usr.bin.chromium` | Chromium | Browser skeleton |
| `usr.sbin.sshd` | OpenSSH server | Network-facing |
| `usr.bin.curl` | curl | Common network tool |
| `usr.bin.git` | git | Development tool |
| `usr.sbin.nft` | nftables | Firewall control |
| `usr.bin.pacman` | pacman | Package manager (use carefully) |

## Recommended workflow

```bash
sudo pacman -S apparmor apparmor-utils
sudo systemctl enable --now apparmor

# Ensure kernel cmdline has:
# apparmor=1 lsm=landlock,lockdown,yama,apparmor

# Install a profile
sudo cp configs/apparmor/usr.bin.firefox /etc/apparmor.d/
sudo apparmor_parser -r /etc/apparmor.d/usr.bin.firefox

# Start in complain mode
sudo aa-complain /etc/apparmor.d/usr.bin.firefox

# Use the application normally, then:
sudo aa-logprof
sudo aa-enforce /etc/apparmor.d/usr.bin.firefox

# Check status
sudo aa-status
```

## Philosophy

- Browsers and network-facing services are priority enforce targets.
- Package managers and low-level tools need careful tuning; start in complain mode.
- The owner retains full root; these profiles reduce blast radius of compromised processes.
