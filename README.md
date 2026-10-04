# Linux Anti-DDoS

A defensive, layered Linux toolkit for reducing the impact of common L3/L4 and L7 denial-of-service traffic.

> **Scope:** defensive infrastructure hardening. No mitigation can make a host absorb an attack larger than its upstream link or provider edge. For volumetric attacks, use upstream filtering/scrubbing/CDN/anycast before traffic reaches the host.

## Layers

- **L3/L4:** nftables connection limits, invalid-state filtering, SYN protection, conntrack sizing, ICMP hygiene, source/destination validation where appropriate.
- **L7:** Nginx/HAProxy request-rate and connection limits, slow-client protections, per-IP controls, caching guidance, application timeouts.
- **Abuse automation:** Fail2ban examples for repeated HTTP/auth abuse.
- **Optional high-rate filtering:** XDP/eBPF integration notes for environments that can safely deploy kernel-level programs.
- **Observability:** counters, logs, conntrack inspection, and a health-check script.

## Quick start

1. Read `docs/THREAT-MODEL.md` and `docs/DEPLOYMENT.md`.
2. Copy the relevant config from `configs/` and **replace example values**.
3. Apply kernel settings from `configs/sysctl/99-anti-ddos.conf` only after reviewing capacity and workload assumptions.
4. Load nftables with `sudo nft -c -f configs/nftables/anti-ddos.nft`, then apply it with `sudo nft -f ...`.
5. Configure your reverse proxy using the Nginx or HAProxy examples.
6. Run `scripts/health-check.sh` and inspect counters before declaring success.

## Important

Do not blindly enable every control. Aggressive limits can block legitimate NAT users, mobile networks, crawlers, WebSockets, long polling, APIs, or internal services. Test in staging and keep an out-of-band console path.

## Directory

```text
configs/     Kernel, nftables, proxy, Fail2ban, systemd examples
scripts/     Validation and health checks
docs/        Threat model, deployment, tuning, architecture
examples/    Prometheus-style alert ideas and topology examples
tests/       Lightweight config checks
```

## License

MIT
