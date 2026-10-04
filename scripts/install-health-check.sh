#!/usr/bin/env bash
set -euo pipefail

install -m 0755 scripts/health-check.sh /usr/local/sbin/anti-ddos-health
install -m 0644 configs/systemd/anti-ddos-health.service /etc/systemd/system/
install -m 0644 configs/systemd/anti-ddos-health.timer /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now anti-ddos-health.timer
