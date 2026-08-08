# BLACKHILL Architecture

## 1. Design Principles

1. **User Sovereignty**: The owner of the machine has unrestricted root access. Security mechanisms protect against external threats and accidental self-damage, not against the legitimate user.
2. **Defense in Depth**: Multiple independent layers (kernel, MAC, network, filesystem, process isolation).
3. **Minimal Default Attack Surface**: Services off by default, strict firewall, hardened kernel parameters.
4. **Reversible Hardening**: Aggressive settings can be relaxed via clear profiles or documented overrides.
5. **Rolling Freshness**: Stay on Arch’s rolling release for newest tools and mitigations.
6. **Premium Operator Experience**: Beautiful, fast, information-dense UI that does not get in the way of power users.

## 2. Core Stack

| Layer              | Choice                          | Notes |
|--------------------|---------------------------------|-------|
| Base               | Arch Linux                      | Rolling, pacman, AUR |
| Kernel             | linux-hardened (preferred)      | Fallback: linux-zen or mainline with hardened cmdline |
| Init               | systemd                         | Compatibility priority |
| MAC                | AppArmor + Landlock + Yama      | Lockdown mode configurable |
| Network Firewall   | nftables                        | Default-deny |
| Filesystem         | Btrfs + LUKS2                   | Snapper snapshots, compression |
| Display Server     | Wayland (Hyprland)              | XWayland available |
| Boot               | systemd-boot or GRUB + UKI      | Secure Boot support |
| Encryption         | LUKS2                           | TPM2 unlock optional |

See the full repository for complete details, configs, and roadmap.
