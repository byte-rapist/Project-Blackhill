# AppArmor Profiles for BLACKHILL

This directory will contain AppArmor profiles tuned for the BLACKHILL security model.

## Status

Currently a placeholder for future profiles. Recommended approach:

1. Install `apparmor` and `apparmor-utils`
2. Enable the service
3. Start with upstream profiles and tighten them
4. Use `aa-genprof` / `aa-logprof` for custom applications

## Priority targets for profiles

- sshd
- firefox / chromium
- package managers (pacman helpers)
- network-facing services
- browsers and document viewers

Profiles should prefer enforce mode for critical services while remaining practical for a root-capable operator system.
