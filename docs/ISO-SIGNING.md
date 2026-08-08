# ISO Signing & Secure Boot (Phase 4)

## Checksums

Every published ISO should ship with:

```bash
sha256sum blackhill-YYYY.MM.DD-x86_64.iso > blackhill-YYYY.MM.DD-x86_64.iso.sha256
```

Verify with:

```bash
sha256sum -c blackhill-YYYY.MM.DD-x86_64.iso.sha256
```

## GPG signature (recommended)

```bash
gpg --detach-sign --armor blackhill-YYYY.MM.DD-x86_64.iso
# produces .iso.asc
```

Users verify with your published public key.

## Secure Boot

For Secure Boot capable releases:

1. Build or obtain a signed UKI / bootloader using keys you control (see `docs/SECURE-BOOT.md`).
2. Ship enrollment instructions for users who want to use their own keys or your project keys.
3. Never force a single global Platform Key on end users who want full control — BLACKHILL philosophy prefers owner-controlled keys.

## Release checklist

- [ ] ISO builds cleanly with `mkarchiso`
- [ ] Boots in UEFI and BIOS VMs
- [ ] Branding and MOTD correct
- [ ] `blackhill-install` present and executable
- [ ] SHA256 published
- [ ] GPG signature published
- [ ] Commit hash / version recorded in release notes
