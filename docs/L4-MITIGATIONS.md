# L3/L4 mitigation catalogue

## TCP

- SYN cookies
- SYN backlog sizing
- SYN rate/concurrency limits
- nftables connection-state filtering
- Conntrack capacity monitoring
- Per-source connection limits
- Service-port allowlisting
- Early invalid-state drops
- Upstream ACLs for abusive networks

## UDP

UDP has no handshake, so state-based controls are less useful. Allowlist required UDP services, rate-limit where compatible, and prefer upstream filtering for volumetric floods.

## ICMP

Do not blindly block ICMP. Permit the types required for correct IP operation and PMTU discovery, while applying sane rate limits.

## Spoofing

Source validation (`rp_filter`) can help on hosts where routing is compatible. Routers/provider edges should enforce anti-spoofing controls such as BCP38 where possible.
