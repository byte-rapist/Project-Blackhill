# Contributing to BLACKHILL

Thank you for your interest in contributing to BLACKHILL.

## Project Philosophy

BLACKHILL prioritizes:

1. **User sovereignty** — the owner of the machine is never locked out.
2. **Strong defaults** — security is on by default, but reversible.
3. **Clarity** — configurations and scripts should be readable and documented.
4. **Arch compatibility** — stay close to upstream Arch; avoid unnecessary divergence.
5. **Premium operator experience** — the desktop and tools should feel precise and high-quality.

## How to Contribute

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/your-feature`).
3. Make focused, well-documented changes.
4. Test on a real Arch system or clean VM.
5. Open a Pull Request with a clear description of *what* and *why*.

## Areas that need help

- AppArmor profiles for common services
- Additional Freedesktop icons (mimetypes, devices, status)
- Kernel command-line / Secure Boot documentation
- First-boot wizard / installer improvements
- Meta-package PKGBUILDs
- Archiso profile completeness
- Documentation and screenshots
- Testing and hardening validation

## Code Style

- Shell scripts: `set -euo pipefail`, clear comments, shellcheck-clean when possible.
- Configs: keep comments explaining non-obvious choices.
- Prefer small, reviewable commits.

## Security

If you discover a security issue, please follow the process in [SECURITY.md](SECURITY.md).

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
