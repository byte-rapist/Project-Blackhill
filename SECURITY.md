# Security Policy

## Supported Versions

BLACKHILL is currently in early foundation / pre-alpha stage. Security fixes will be applied to the `main` branch.

## Reporting a Vulnerability

**Do not open public GitHub issues for security vulnerabilities.**

Please report security issues privately by emailing the maintainers or opening a private security advisory on GitHub (Security → Advisories) if available.

Include:

- Description of the issue
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

We will acknowledge receipt as soon as possible and work on a coordinated disclosure.

## Scope

This policy covers:

- Hardening configurations and scripts in this repository
- Theme and installer scripts
- Any future packages or ISO build process published under this project

It does **not** cover:

- Upstream Arch Linux, linux-hardened, or third-party tools
- Misconfiguration by end users
- Issues that only appear when the user intentionally weakens the defaults

## Hardening Philosophy

BLACKHILL aims for strong defaults while preserving full root access for the legitimate owner. Trade-offs between security and usability are documented in the architecture and configuration comments.
