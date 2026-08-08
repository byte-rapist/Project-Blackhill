# AppArmor Profiles — BLACKHILL Phase 1

## Goal

Provide practical, enforce-mode-ready profiles for high-value targets while remaining usable on a root-capable operator system.

## Current profiles (skeletons)

| Profile | Target | Status |
|---------|--------|--------|
| `usr.bin.firefox` | Firefox | Skeleton — tighten with aa-logprof |
| `usr.sbin.sshd` | OpenSSH server | Skeleton |
| `usr.bin.pacman` | pacman | Skeleton (careful — package managers are complex) |
| `usr.bin.pass` | pass / password-store | Basic |

## How to use

1. Install AppArmor:
   ```bash
   sudo pacman -S apparmor apparmor-utils
   sudo systemctl enable --now apparmor
   ```

2. Ensure kernel cmdline contains:
   ```
   apparmor=1 lsm=landlock,lockdown,yama,apparmor
   ```

3. Copy desired profiles to `/etc/apparmor.d/` and load:
   ```bash
   sudo cp configs/apparmor/usr.bin.firefox /etc/apparmor.d/
   sudo apparmor_parser -r /etc/apparmor.d/usr.bin.firefox
   ```

4. Start in complain mode first, then enforce after tuning:
   ```bash
   sudo aa-complain /etc/apparmor.d/usr.bin.firefox
   # use the application, then:
   sudo aa-logprof
   sudo aa-enforce /etc/apparmor.d/usr.bin.firefox
   ```

## Philosophy

Profiles should reduce the blast radius of compromised applications without making the system painful for a skilled owner who needs root and low-level access. Prefer enforce mode for network-facing and browser processes; keep the rest practical.
