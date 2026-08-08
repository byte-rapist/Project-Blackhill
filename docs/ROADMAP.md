# BLACKHILL Development Roadmap

## Phase 0 — Foundation (Complete in this repository)
- [x] Project structure
- [x] Architecture document
- [x] Aggressive sysctl hardening profile
- [x] nftables default-deny ruleset
- [x] Hardening applicator script
- [x] Hyprland premium dark configuration skeleton
- [x] Tooling recommendation list
- [x] Branding (os-release, MOTD)
- [x] ISO build notes

## Phase 1 — Hardened Base (Next)
- Complete AppArmor profile set for key services
- Kernel command-line recommendation file + GRUB/systemd-boot snippets
- Btrfs + snapper + LUKS recommended layout + automation
- USBGuard policy
- First-boot wizard script
- Lynis / audit integration

## Phase 2 — Premium UI
- Full blackhill-dark theme pack (waybar, rofi, kitty, hyprlock, hyprpaper, GTK/Qt)
- Security status modules in waybar
- Simple TUI/GUI Control Center for security toggles
- Optional Plasma theme variant

## Phase 3 — Tooling & Repository
- Meta-package definitions (PKGBUILDs)
- Decision: depend on BlackArch repo vs. maintain own curated subset
- Defensive tool packaging improvements
- Documentation for each major tool category

## Phase 4 — Distribution
- Full Archiso profile with branding, packages, and customize scripts
- Installer that enforces encryption and applies profile
- Reproducible builds
- Signed ISO + Secure Boot keys guidance

## Phase 5 — Public Alpha
- Website / docs site
- Community guidelines
- Security advisory process
- Continuous integration for configs and ISO builds
