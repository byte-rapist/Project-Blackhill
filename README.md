# BLACKHILL OS

**The Final Boss of Machine Control**

[![License: MIT](https://img.shields.io/badge/License-MIT-red.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-foundation%20%2F%20pre--alpha-orange)]()
[![Base](https://img.shields.io/badge/base-Arch%20Linux-blue)]()

BLACKHILL is a hardened, root-first Arch Linux derivative focused on absolute user sovereignty, strong security defaults, and a premium dark operator desktop.

It is designed for people who want full control of their machine, extensive cybersecurity capabilities, and a refined, high-end interface — without being locked out of their own system.

> **Current status**: Foundation / pre-alpha. The repository contains a complete, usable configuration and theme foundation that can be applied on top of Arch Linux today. A full custom ISO and installer are on the roadmap.

## Key Features

- **Full root access by design** — the owner is never treated as a threat
- **Strong hardening defaults** — linux-hardened preference, AppArmor-ready, aggressive sysctl, nftables default-deny
- **Premium dark UI** — Hyprland + Blackhill Dark theme (matte black + deep crimson)
- **Custom icon theme** — clean, recognizable icons in the project visual language
- **Security tooling path** — curated recommendations + compatibility with BlackArch-scale toolsets
- **Clear documentation** — architecture, installation, security policy, and contribution guidelines

## Quick Start

```bash
git clone https://github.com/byte-rapist/Project-Blackhill.git
cd Project-Blackhill
sudo ./scripts/apply-hardening.sh
```

Then follow the full guide:

**→ [Installation Guide](docs/INSTALL.md)**

## Documentation

| Document | Description |
|----------|-------------|
| [Installation](docs/INSTALL.md) | Step-by-step setup on Arch |
| [Architecture](docs/ARCHITECTURE.md) | Design principles and security model |
| [Roadmap](docs/ROADMAP.md) | Phased development plan |
| [Contributing](CONTRIBUTING.md) | How to contribute |
| [Security Policy](SECURITY.md) | Vulnerability reporting |
| [Code of Conduct](CODE_OF_CONDUCT.md) | Community standards |

## Project Structure

```
Project-Blackhill/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── SECURITY.md
├── CODE_OF_CONDUCT.md
├── docs/                  # Architecture, install, roadmap
├── configs/               # sysctl, nftables, Hyprland, ...
├── scripts/               # Hardening and helper scripts
├── themes/blackhill-dark/ # GTK, icons, waybar, rofi, installer
├── branding/              # os-release, MOTD
├── packages/              # Tool lists / future meta-packages
└── iso/                   # Archiso notes and future profile
```

## Philosophy

Security is achieved through strong defaults, visibility, and powerful tools — **never** by locking the legitimate user out of their own machine.

BLACKHILL treats the owner as the final authority.

## Relationship to Other Projects

- **Arch Linux** — Direct base. Full pacman and AUR compatibility.
- **BlackArch** — Closest relative for tool breadth. BLACKHILL adds stronger hardening defaults and a premium UI layer.
- **Kali Linux** — Excellent Debian-based alternative. BLACKHILL targets deeper control and Arch rolling freshness.

## Disclaimer

BLACKHILL provides high-capability tools and full root access. Misuse can cause serious damage. Use only on systems you own or are explicitly authorized to test. The authors assume no liability.

## License

This project is released under the [MIT License](LICENSE).

---

**BLACKHILL** — Own the machine. Completely.
