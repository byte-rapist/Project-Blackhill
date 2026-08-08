#!/usr/bin/env bash
# BLACKHILL Waybar security status module
# Returns JSON for waybar custom module

set -euo pipefail

status="SECURE"
class="security-high"
tooltip="BLACKHILL Security Status"

# Check firewall
if systemctl is-active --quiet nftables 2>/dev/null || nft list ruleset &>/dev/null; then
  fw="Firewall: active"
else
  fw="Firewall: inactive"
  status="CHECK"
  class="security-medium"
fi

# Check AppArmor
if command -v aa-status &>/dev/null && aa-status --enabled &>/dev/null; then
  aa="AppArmor: enabled"
else
  aa="AppArmor: not active"
  if [[ "$status" == "SECURE" ]]; then
    status="CHECK"
    class="security-medium"
  fi
fi

# Check if running as root (informational)
if [[ $EUID -eq 0 ]]; then
  user_note="Session: root"
else
  user_note="Session: user"
fi

tooltip="${tooltip}\n${fw}\n${aa}\n${user_note}"

printf '{"text": "%s", "class": "%s", "tooltip": "%s"}\n' "$status" "$class" "$tooltip"
