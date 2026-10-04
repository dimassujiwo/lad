#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"

for f in "$root/configs/nftables/anti-ddos.nft" "$root/configs/sysctl/99-anti-ddos.conf" "$root/configs/nginx/anti-ddos.conf"; do
  test -s "$f"
done

grep -q 'tcp_syncookies = 1' "$root/configs/sysctl/99-anti-ddos.conf"
grep -q 'ct state invalid drop' "$root/configs/nftables/anti-ddos.nft"
grep -q 'limit_req_zone' "$root/configs/nginx/anti-ddos.conf"
grep -q 'stick-table' "$root/configs/haproxy/anti-ddos.cfg"

echo 'static checks passed'
