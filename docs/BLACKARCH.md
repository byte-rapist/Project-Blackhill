# Integrating BlackArch with BLACKHILL

BLACKHILL is deliberately compatible with the [BlackArch](https://blackarch.org) repository. BlackArch provides one of the largest curated collections of security tools on Arch Linux. BLACKHILL provides the hardened base, premium UI, and operator philosophy on top.

## Recommended model

```
Arch Linux
  └─ BLACKHILL hardening + desktop + branding
       └─ BlackArch tools (optional, selective or full)
```

This gives you:

- Strong defaults and a refined interface (BLACKHILL)
- Massive tool depth when needed (BlackArch)

## Enable BlackArch

Follow the official instructions: https://blackarch.org/downloads.html#install-repo

Typical steps:

```bash
# Download and install the strap script (verify the current official method)
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

# Update
sudo pacman -Syu
```

Always verify the strap script and signatures using the official BlackArch documentation — do not trust outdated mirrors of the script.

## Usage patterns

### Selective tools
Install only what you need from BlackArch categories:

```bash
sudo pacman -S blackarch-<category>
# e.g. blackarch-webapp, blackarch-exploitation, blackarch-wireless, ...
```

### Full toolset
Possible but heavy. Prefer selective installs on a daily driver.

### With BLACKHILL meta-packages

```bash
# First apply BLACKHILL base + desktop from this repo / PKGBUILDs
# Then add BlackArch tools as required
```

## Important notes

- BlackArch tools can be powerful and dangerous. Use only on systems you own or are authorized to test.
- Some BlackArch packages may conflict with or override defaults. After large installs, re-check firewall, AppArmor, and sysctl.
- Keep the BLACKHILL hardening scripts and theme as the consistent layer regardless of which tools you add.

## Summary

BLACKHILL does not re-implement BlackArch. It is designed to sit cleanly underneath or alongside it: hardened foundation + premium operator UI + optional BlackArch firepower.
