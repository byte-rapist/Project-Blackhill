# BLACKHILL OS

**The Final Boss of Machine Control**

[![License: MIT](https://img.shields.io/badge/License-MIT-red.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-foundation%20%2F%20pre--alpha-orange)]()
[![Base](https://img.shields.io/badge/base-Arch%20Linux-blue)]()
[![Version](https://img.shields.io/badge/version-0.1.0--foundation-darkred)]()

BLACKHILL is a hardened, root-first Arch Linux derivative focused on absolute user sovereignty, strong security defaults, and a premium dark operator desktop.

It is designed for people who want full control of their machine, extensive cybersecurity capabilities, and a refined high-end interface — without being locked out of their own system.

> **Current status**: Foundation / pre-alpha (v0.1.0). This repository provides a complete, usable configuration, theme, and documentation set that turns Arch Linux into a BLACKHILL system today. A custom ISO and installer are on the roadmap.

## Key Features

- **Full root access by design** — the owner is never treated as a threat
- **Strong hardening defaults** — linux-hardened preference, AppArmor-ready, aggressive sysctl, nftables default-deny
- **Premium dark UI** — Hyprland + Blackhill Dark (matte black + deep crimson)
- **Complete theme stack** — GTK 3/4, icons, Waybar, Rofi, Kitty, Hyprlock, Hypridle
- **Custom icon theme** — clean, recognizable SVGs in the project visual language
- **Security tooling path** — curated lists + BlackArch compatibility
- **Professional project structure** — LICENSE, security policy, contributing guide, full docs

## Quick Start

```bash
git clone https://github.com/byte-rapist/Project-Blackhill.git
cd Project-Blackhill
sudo ./scripts/apply-hardening.sh
cd themes/blackhill-dark && ./install-theme.sh
```

Then follow the full guide:

**→ [Installation Guide](docs/INSTALL.md)**

## Documentation

| Document | Description |
|----------|-------------|
| [Installation](docs/INSTALL.md) | Step-by-step setup on Arch |
| [Architecture](docs/ARCHITECTURE.md) | Design principles and security model |
| [Hardening Rationale](docs/HARDENING.md) | Why the security choices were made |
| [Roadmap](docs/ROADMAP.md) | Phased development plan |
| [FAQ](docs/FAQ.md) | Common questions |
| [Contributing](CONTRIBUTING.md) | How to contribute |
| [Security Policy](SECURITY.md) | Vulnerability reporting |
| [Code of Conduct](CODE_OF_CONDUCT.md) | Community standards |

## Project Structure

```
Project-Blackhill/
├── README.md / LICENSE / CHANGELOG.md / VERSION
├── CONTRIBUTING.md / SECURITY.md / CODE_OF_CONDUCT.md
├── Makefile
├── docs/                     # Full documentation set
├── configs/
│   ├── sysctl/               # Kernel hardening
│   ├── nftables/             # Firewall
│   ├── hypr/                 # Hyprland + lock + idle + paper
│   ├── waybar/               # Status bar
│   ├── kitty/                # Terminal theme
│   ├── kernel/               # Recommended cmdline
│   └── apparmor/             # Future profiles
├── scripts/                  # Hardening + first-boot
├── themes/blackhill-dark/    # Complete theme pack + icons
├── branding/                 # os-release, MOTD
├── packages/                 # Tool lists + future meta-packages
└── iso/                      # Archiso notes + profile skeleton
```

## Philosophy

Security is achieved through strong defaults, visibility, and powerful tools — **never** by locking the legitimate user out of their own machine.

BLACKHILL treats the owner as the final authority.

## Disclaimer

BLACKHILL provides high-capability tools and full root access. Misuse can cause serious damage. Use only on systems you own or are explicitly authorized to test. The authors assume no liability.

## License

This project is released under the [MIT License](LICENSE).

---

**BLACKHILL** — Own the machine. Completely.
