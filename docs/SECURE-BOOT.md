# Secure Boot Guidance for BLACKHILL

## Goal

Allow the owner to enroll their own keys and boot a signed BLACKHILL / Arch kernel while retaining full control.

## High-level steps (user-controlled keys)

1. **Install tools**
   ```bash
   sudo pacman -S efitools sbsigntools openssl
   ```

2. **Create your own keys** (example)
   ```bash
   mkdir -p ~/secureboot-keys && cd ~/secureboot-keys
   openssl req -new -x509 -newkey rsa:2048 -keyout PK.key -out PK.crt -days 3650 -nodes -subj "/CN=BLACKHILL Platform Key/"
   openssl req -new -x509 -newkey rsa:2048 -keyout KEK.key -out KEK.crt -days 3650 -nodes -subj "/CN=BLACKHILL Key Exchange Key/"
   openssl req -new -x509 -newkey rsa:2048 -keyout db.key -out db.crt -days 3650 -nodes -subj "/CN=BLACKHILL Signature Database Key/"
   ```

3. **Convert for UEFI enrollment**
   ```bash
   cert-to-efi-sig-list PK.crt PK.esl
   sign-efi-sig-list -k PK.key -c PK.crt PK PK.esl PK.auth
   # Repeat similar steps for KEK and db as needed
   ```

4. **Enroll in firmware**
   - Reboot into UEFI setup
   - Enter Secure Boot / Key Management
   - Enroll PK, KEK, and db with your generated files
   - Or use `efi-updatevar` / `sbkeysync` from a live environment with care

5. **Sign your bootloader and kernel/UKI**
   ```bash
   sbsign --key db.key --cert db.crt --output /boot/EFI/BOOT/BOOTX64.EFI.signed /boot/EFI/BOOT/BOOTX64.EFI
   # Prefer Unified Kernel Images (UKI) for simpler measured boot paths
   ```

6. **Enable Secure Boot** in firmware after successful signed boot test.

## Recommendations specific to BLACKHILL

- Prefer **UKI** (Unified Kernel Image) via `ukify` or dracut/mkinitcpio UKI support.
- Keep recovery keys and a signed rescue USB.
- Document your enrollment process; losing Platform Key control can brick Secure Boot boot paths.
- This guidance is intentionally high-level. Firmware interfaces differ widely — always have a recovery plan.

## Status

This document provides the owner-controlled Secure Boot path. Automated enrollment scripts are not included yet because firmware behaviour varies too much for a one-size-fits-all tool.
