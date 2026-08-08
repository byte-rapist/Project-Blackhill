#!/usr/bin/env bash
# BLACKHILL Waybar security status — Phase 2 excellence
# Returns JSON for the custom/security module

set -euo pipefail

score=0
max=4
issues=()

# 1. Firewall
if systemctl is-active --quiet nftables 2>/dev/null; then
  ((score++)) || true
  fw="Firewall active"
elif command -v nft &>/dev/null && nft list ruleset 2>/dev/null | grep -q "policy drop"; then
  ((score++)) || true
  fw="Firewall rules present"
else
  fw="Firewall inactive"
  issues+=("$fw")
fi

# 2. AppArmor
if command -v aa-status &>/dev/null && aa-status --enabled &>/dev/null 2>&1; then
  ((score++)) || true
  aa="AppArmor enabled"
else
  aa="AppArmor off"
  issues+=("$aa")
fi

# 3. Kernel hardening signal (kptr_restrict)
kptr=$(sysctl -n kernel.kptr_restrict 2>/dev/null || echo 0)
if [[ "$kptr" -ge 1 ]]; then
  ((score++)) || true
  kr="kptr_restrict=$kptr"
else
  kr="kptr_restrict weak"
  issues+=("$kr")
fi

# 4. Not running GUI tools as root unnecessarily (informational)
if [[ $EUID -eq 0 ]]; then
  user="root session"
  issues+=("$user")
else
  ((score++)) || true
  user="user session"
fi

# Derive display
if [[ $score -eq $max ]]; then
  text="SECURE"
  class="security-high"
elif [[ $score -ge 2 ]]; then
  text="CHECK"
  class="security-medium"
else
  text="RISK"
  class="security-low"
fi

tooltip="BLACKHILL Security  ${score}/${max}\n${fw}\n${aa}\n${kr}\n${user}"
if [[ ${#issues[@]} -gt 0 ]]; then
  tooltip+="\n───\nIssues: ${issues[*]}"
fi

# Escape for JSON
tooltip=${tooltip//$'\n'/\n}

printf '{"text":"%s","class":"%s","tooltip":"%s"}\n' "$text" "$class" "$tooltip"
