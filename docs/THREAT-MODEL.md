# Threat model

## Covered

- TCP SYN floods and excessive TCP connection creation
- UDP floods reaching the host
- ICMP floods reaching the host
- Invalid/abnormal connection-state traffic
- Connection exhaustion and conntrack pressure
- HTTP request floods
- Slow HTTP clients / slow headers and bodies
- Per-source connection and request abuse
- Repeated application/authentication failures

## Not solved locally

- Saturating the ISP/transit link
- Large distributed attacks where source IPs are highly distributed
- Attacks against a shared upstream load balancer/firewall
- Protocol/application vulnerabilities that consume disproportionate CPU or memory per valid request
- TLS handshake floods that exceed host cryptographic capacity

For those cases, use upstream ACLs, cloud scrubbing, CDN/WAF, anycast, provider RTBH/Flowspec where available, or a dedicated DDoS protection service.

## Design principle

Drop cheaply and early, before expensive state allocation. Rate-limit at the edge, then enforce progressively tighter controls as traffic reaches L7.
