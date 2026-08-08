# BLACKHILL Roadmap

## Phase 0 — Foundation ✅ COMPLETE

- [x] Professional repository layout and metadata
- [x] LICENSE, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT, VERSION, CHANGELOG
- [x] Full documentation (Install, Architecture, Hardening, FAQ, Post-Install, Roadmap)
- [x] Sysctl hardening + nftables default-deny
- [x] Hardening script + first-boot wizard
- [x] Complete Hyprland ecosystem (hyprland, hyprlock, hypridle, hyprpaper)
- [x] Blackhill Dark theme stack (GTK, Waybar, Rofi, Kitty, icons)
- [x] USBGuard baseline
- [x] Kernel cmdline recommendations
- [x] AppArmor guidance
- [x] Tool lists + packages structure
- [x] Archiso profile skeleton
- [x] Makefile

**The foundation is finished.** Users can clone the repository and produce a hardened, premium dark, root-first BLACKHILL system on top of Arch Linux.

## Phase 1 — Hardened Base (Next)

- [ ] Expanded AppArmor profiles for key services
- [ ] More complete USBGuard and device policies
- [ ] Btrfs + snapper automation helpers
- [ ] Deeper Lynis / audit integration
- [ ] Secure Boot user-key guidance

## Phase 2 — Premium UI Polish

- [ ] Expanded icon set (mimetypes, devices, extra status/actions)
- [ ] Cursor theme
- [ ] Waybar security status modules
- [ ] Lightweight Control Center

## Phase 3 — Packaging

- [ ] Meta-package PKGBUILDs
- [ ] BlackArch integration documentation

## Phase 4 — Distribution

- [ ] Complete Archiso profile
- [ ] Custom installer
- [ ] Reproducible signed ISO builds

## Phase 5 — Public Releases & Community

- [ ] Versioned GitHub Releases
- [ ] Documentation site
- [ ] CI and security advisory process

## Long-term

- Optional SELinux path
- Measured boot / attestation helpers
- Hardware-specific profiles
- Official mirrors and package infrastructure
