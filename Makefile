# BLACKHILL Makefile
# Common developer tasks

.PHONY: help hardening theme check lint

help:
	@echo "BLACKHILL development helpers"
	@echo ""
	@echo "  make hardening   - Show how to apply hardening (requires root)"
	@echo "  make theme       - Show theme installation command"
	@echo "  make check       - Basic repository sanity checks"
	@echo "  make lint        - Run shellcheck on scripts if available"

hardening:
	@echo "Run as root:"
	@echo "  sudo ./scripts/apply-hardening.sh"

theme:
	@echo "Install theme:"
	@echo "  cd themes/blackhill-dark && ./install-theme.sh"

check:
	@echo "Checking critical files..."
	@test -f LICENSE && echo "  LICENSE: OK" || echo "  LICENSE: MISSING"
	@test -f README.md && echo "  README.md: OK" || echo "  README.md: MISSING"
	@test -f scripts/apply-hardening.sh && echo "  hardening script: OK" || echo "  hardening script: MISSING"
	@test -f configs/sysctl/99-blackhill-hardening.conf && echo "  sysctl: OK" || echo "  sysctl: MISSING"
	@test -f configs/nftables/blackhill.nft && echo "  nftables: OK" || echo "  nftables: MISSING"
	@echo "Done."

lint:
	@if command -v shellcheck >/dev/null; then \
		shellcheck scripts/*.sh themes/blackhill-dark/install-theme.sh || true; \
	else \
		echo "shellcheck not installed"; \
	fi
