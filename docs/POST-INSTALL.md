# BLACKHILL Post-Install Checklist

After running the hardening script and first-boot helper, work through this list.

## Critical

- [ ] Review `/etc/sysctl.d/99-blackhill-hardening.conf`
- [ ] Review `/etc/nftables.conf` and start the service if appropriate
- [ ] Install and configure `linux-hardened` (or apply recommended cmdline)
- [ ] Set up full-disk encryption + Btrfs snapshots if not done at install time
- [ ] Copy branding files to `/etc`
- [ ] Run `themes/blackhill-dark/install-theme.sh`
- [ ] Copy Hyprland configs to `~/.config/hypr/`
- [ ] Reboot and verify Hyprland + theme

## Strongly Recommended

- [ ] Configure SSH hardening if remote access is used
- [ ] Enable AppArmor and verify profiles
- [ ] Install and baseline USBGuard
- [ ] Run `lynis audit system` and address high-priority findings
- [ ] Set up automatic snapshots / backup strategy
- [ ] Create a non-root daily user if you have been working as root

## Optional / Advanced

- [ ] Enable BlackArch repository for extended tooling
- [ ] Install selected tools from `packages/blackhill-tools.txt`
- [ ] Configure Secure Boot with your own keys
- [ ] Set up WireGuard or other VPN
- [ ] Customize Waybar modules and Hyprland keybinds

## Verification Commands

```bash
sysctl kernel.kptr_restrict kernel.yama.ptrace_scope kernel.dmesg_restrict
nft list ruleset
aa-status
lynis audit system
```
