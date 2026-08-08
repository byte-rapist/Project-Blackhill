# BLACKHILL Roadmap

## Phase 0 — Foundation (Completed)
- [x] Project structure and professional repository layout
- [x] Architecture and installation documentation
- [x] Aggressive sysctl hardening profile
- [x] nftables default-deny ruleset
- [x] Hardening applicator script
- [x] Hyprland premium configuration
- [x] Blackhill Dark theme (GTK, Waybar, Rofi)
- [x] Custom icon theme (core set)
- [x] Branding (os-release, MOTD)
- [x] LICENSE, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT
- [x] Tool recommendation list

## Phase 1 — Hardened Base (In Progress)
- [ ] Expanded AppArmor profiles for common services
- [ ] Kernel command-line snippets for GRUB and systemd-boot
- [ ] USBGuard baseline policy
- [ ] First-boot / post-install wizard script
- [ ] Lynis / audit integration helpers
- [ ] Btrfs + snapper recommended layout documentation and helpers

## Phase 2 — Premium UI Completion
- [ ] Full icon set (mimetypes, devices, more status/actions)
- [ ] Cursor theme
- [ ] Hyprlock + hypridle polished configs
- [ ] Kitty / Alacritty theme files
- [ ] Optional security status modules for waybar
- [ ] Simple Control Center (TUI or lightweight GUI)

## Phase 3 — Packaging & Tools
- [ ] Meta-package PKGBUILDs (`blackhill-base`, `blackhill-desktop`, etc.)
- [ ] Decision and documentation on BlackArch integration
- [ ] Defensive tooling packaging notes

## Phase 4 — Distribution
- [ ] Complete Archiso profile
- [ ] Custom installer that applies BLACKHILL profile and encryption defaults
- [ ] Reproducible ISO builds
- [ ] Signing and Secure Boot guidance

## Phase 5 — Public Releases
- [ ] Versioned releases with changelogs
- [ ] Website / documentation site
- [ ] Community processes and security advisory workflow
- [ ] Continuous integration for configs and ISO builds

## Long-term
- Optional SELinux path
- Measured boot / attestation helpers
- Hardware-specific profiles
- Official mirrors and package infrastructure
