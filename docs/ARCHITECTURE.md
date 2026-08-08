# BLACKHILL Architecture

## 1. Design Principles

1. **User Sovereignty** — The legitimate owner has unrestricted root access. Security mechanisms protect against external threats and accidental damage, never against the owner.
2. **Defense in Depth** — Multiple independent layers (kernel, MAC, network, filesystem, process isolation).
3. **Minimal Default Attack Surface** — Services off by default, strict firewall, hardened kernel parameters.
4. **Reversible Hardening** — Aggressive settings can be relaxed via clear profiles or documented overrides.
5. **Rolling Freshness** — Stay on Arch Linux rolling release for newest tools and mitigations.
6. **Premium Operator Experience** — The desktop and tooling should feel precise, fast, and high-quality.

## 2. Core Stack

| Layer            | Choice                     | Notes |
|------------------|----------------------------|-------|
| Base             | Arch Linux                 | Rolling, pacman, AUR |
| Kernel           | linux-hardened (preferred) | Fallback: linux-zen / mainline + hardened cmdline |
| Init             | systemd                    | Compatibility priority |
| MAC              | AppArmor + Landlock + Yama | Lockdown mode configurable |
| Firewall         | nftables                   | Default-deny |
| Filesystem       | Btrfs + LUKS2              | Snapper recommended |
| Display          | Wayland (Hyprland)         | XWayland available |
| Boot             | systemd-boot or GRUB + UKI | Secure Boot support planned |
| Encryption       | LUKS2                      | TPM2 unlock optional |

## 3. Security Layers

### Kernel & Boot
- Prefer `linux-hardened`
- Strong command-line mitigations and LSM stack
- Module signing / lockdown path
- kexec disabled by default in hardening profile

### Mandatory Access Control
- AppArmor for key services (expandable)
- Landlock + Yama for process restrictions
- Lockdown mode (integrity or confidentiality)

### Network
- nftables default-deny input/forward
- Rate-limited SSH
- WireGuard first-class

### Filesystem & Integrity
- Full-disk encryption strongly recommended
- Btrfs + snapshots
- Protected hardlinks/symlinks and related sysctls

### Process & Memory
- Restricted ptrace, dmesg, kptrs
- firejail / bubblewrap recommended for untrusted applications

## 4. Desktop & UI

- Primary compositor: Hyprland
- Theme: Blackhill Dark (matte black + deep crimson)
- Components: waybar, rofi, kitty, custom icons, GTK theme
- Design goal: calm, powerful, expensive-feeling operator environment

## 5. Tooling Strategy

BLACKHILL does not maintain thousands of packages itself. It:

- Leverages Arch + AUR
- Recommends the BlackArch repository for breadth
- Provides curated lists and (future) meta-packages focused on quality and integration with the hardened base

## 6. Distribution Path

Current stage: configuration + theme + scripts on top of Arch.

Future stages: custom Archiso profile, installer that applies the BLACKHILL profile, signed releases, and optional repository.

## 7. Threat Model (summary)

BLACKHILL is designed for a skilled user who wants maximum control and strong defaults against remote and local unprivileged attackers, while retaining the ability to perform low-level and offensive security work. It is not a "secure by obscurity" or "locked-down consumer" distribution.
