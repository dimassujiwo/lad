#!/usr/bin/env bash
set -euo pipefail

printf '%s\n' '=== Linux Anti-DDoS health check ==='

command -v nft >/dev/null && { echo '[OK] nft'; nft list ruleset >/dev/null; } || echo '[WARN] nft not installed'
command -v sysctl >/dev/null && echo '[OK] sysctl'
command -v ss >/dev/null && echo '[OK] ss'
command -v conntrack >/dev/null && echo '[OK] conntrack' || echo '[INFO] conntrack userspace tool not installed'

printf '\n--- TCP summary ---\n'
ss -s || true

printf '\n--- SYN backlog / syncookies ---\n'
sysctl net.ipv4.tcp_syncookies net.ipv4.tcp_max_syn_backlog net.core.somaxconn || true

printf '\n--- conntrack ---\n'
if [[ -r /proc/sys/net/netfilter/nf_conntrack_count ]]; then
  cat /proc/sys/net/netfilter/nf_conntrack_count
  cat /proc/sys/net/netfilter/nf_conntrack_max
fi

printf '\n--- nftables counters ---\n'
nft list ruleset 2>/dev/null | grep -E 'counter|packets|bytes|drop' | head -80 || true
