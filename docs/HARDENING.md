# BLACKHILL Hardening Rationale

This document explains the major hardening choices.

## Kernel parameters (sysctl)

- `kernel.kptr_restrict = 2` — hide kernel pointers from unprivileged users
- `kernel.dmesg_restrict = 1` — restrict dmesg
- `kernel.yama.ptrace_scope = 2` — restrict ptrace (stronger process isolation)
- `kernel.kexec_load_disabled = 1` — prevent kexec-based attacks
- Network redirect and source-routing protections
- `net.core.bpf_jit_harden = 2` — harden BPF JIT

These settings trade a small amount of convenience (and some debugging ease) for a meaningfully smaller attack surface.

## Firewall

nftables is configured with a default-deny input and forward policy. Only established connections, basic ICMP, DHCP, and rate-limited SSH are allowed by default. This forces explicit decisions about what services are exposed.

## Kernel selection

`linux-hardened` is preferred because it ships with more security-oriented compile-time options and defaults. Users who need maximum hardware compatibility or performance can fall back to mainline or zen with the recommended command-line mitigations.

## AppArmor

AppArmor is enabled as the primary MAC framework because it is relatively maintainable on a rolling distribution compared with a full custom SELinux policy. Profiles will be expanded over time.

## User model

Root remains fully available. The hardening is aimed at protecting the system from external and unprivileged local threats while preserving the owner’s ultimate authority.
