# BLACKHILL OS

**The Final Boss of Machine Control**

BLACKHILL is a hardened, root-first Arch Linux derivative designed for absolute user sovereignty, extreme cybersecurity capabilities, and a premium dark UI. It aims to surpass stock Arch and Kali Linux in security posture, tool depth, and operator experience while remaining fully transparent and controllable by the user (root is not an afterthought — it is the design center).

> **Status**: Foundation / Blueprint stage (v0.1). This repository contains the complete architectural plan, hardening configurations, UI theme, package definitions, and Archiso skeleton required to bootstrap BLACKHILL.

## Vision

- **Base**: Pure Arch Linux (rolling, pacman + AUR)
- **Control**: Full root access by design. No artificial restrictions that hide the machine from its owner.
- **Security**: Aggressive defaults (linux-hardened preference, AppArmor, strict sysctl, nftables default-deny, LUKS2 + Btrfs snapshots, measured boot path) that exceed typical Arch and Kali installs.
- **Capabilities**: Tooling depth inspired by (and intended to exceed) Kali + BlackArch, with stronger defensive/blue-team integration and low-level/hardware focus.
- **UI**: Premium, high-contrast, matte black + deep crimson theme on Hyprland (Wayland). Fast, beautiful, operator-focused — not cartoon “hacker” aesthetics.
- **Philosophy**: The user is the final authority. Security is achieved through strong defaults, clear visibility, and powerful tools — never by locking the owner out.

## Project Structure

```
BLACKHILL/
├── README.md                 # This file
├── docs/                     # Architecture, hardening rationale, roadmap
├── configs/                  # Ready-to-deploy system configurations
│   ├── sysctl/
│   ├── apparmor/
│   ├── nftables/
│   ├── ssh/
│   ├── hypr/                 # Hyprland + related
│   ├── waybar/
│   └── grub/
├── scripts/                  # Hardening, first-boot, installer helpers
├── packages/                 # Meta-package definitions & tool lists
├── themes/blackhill-dark/    # Premium UI theme
├── branding/                 # os-release, MOTD, logos (text), boot messages
└── iso/                      # Archiso profile skeleton
```

## Quick Start (for developers / early adopters)

1. Install a clean Arch Linux system (or use a VM).
2. Clone or copy this repository.
3. Apply base hardening:
   ```bash
   sudo ./scripts/apply-hardening.sh
   ```
4. Install the UI theme and Hyprland stack (see `themes/` and `docs/ui.md`).
5. Install tool meta-packages (once the repository is live) or manually from the lists in `packages/`.
6. For ISO building: follow `iso/README.md` (requires archiso on an Arch host).

## Roadmap (High Level)

| Phase | Goal | Status |
|-------|------|--------|
| 0 | Project skeleton, branding, docs, core configs | **Done** (this repo) |
| 1 | Hardened base (sysctl, AppArmor, nftables, encryption defaults) | In progress |
| 2 | Premium Hyprland theme + security dashboard | In progress |
| 3 | Tool meta-packages + curated BlackArch-style repo | Planned |
| 4 | Custom Archiso live + installer | Planned |
| 5 | First public alpha ISO + documentation site | Future |

## Security Model Summary

- Kernel: Prefer `linux-hardened`. Aggressive command-line mitigations.
- MAC: AppArmor (enforcing profiles for key services) + Landlock + Yama + Lockdown.
- Network: nftables default-deny + rate limiting. WireGuard first-class.
- Filesystem: LUKS2 full-disk encryption + Btrfs with automatic snapshots (snapper).
- Boot: UKI preferred, Secure Boot with user keys supported.
- User model: Root is available and powerful. Sudo is present but not passwordless by default. Clear warnings for high-risk operations.
- Tools: Offensive + Defensive + RE + Firmware + Cloud/Container escape suites.

## Relationship to Existing Projects

- **Arch Linux**: Direct base. Full compatibility with pacman and AUR.
- **BlackArch**: Closest spiritual relative (Arch + massive security toolset). BLACKHILL adds stronger hardening defaults, premium UI, and a “user is root” control philosophy.
- **Kali Linux**: Excellent but Debian-based and more opinionated about the user experience. BLACKHILL targets deeper control and fresher packages via Arch rolling.

## Disclaimer

BLACKHILL is a high-capability system. Full root access + extensive offensive tooling means it can cause significant damage if misused or if the machine is compromised. Use only on systems you own or have explicit authorization to test. The maintainers assume no liability.

## License

Configs and scripts in this repository are provided under the MIT License unless otherwise noted. Arch Linux packages remain under their respective licenses.

---

**BLACKHILL** — Own the machine. Completely.
