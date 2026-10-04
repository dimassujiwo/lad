# L7 mitigation catalogue

Use several layers and tune from measured legitimate traffic.

## HTTP request floods

- Per-source request-rate limiting
- Global concurrency limits
- Endpoint-specific limits for expensive APIs
- Cache static/idempotent responses
- Reject malformed methods/headers early
- Bound request body size
- Short connect/header/body/read timeouts
- Queue expensive work asynchronously
- Circuit breakers and bounded worker pools

## Slow-client attacks

- Header timeout
- Body timeout
- Minimum data-rate policies where supported
- Maximum header count/size
- Maximum request body size
- Maximum concurrent connections per source

## TLS exhaustion

- Terminate TLS at a scalable edge/CDN/LB where possible
- Prefer modern TLS configurations
- Reuse sessions where appropriate
- Bound handshake/concurrent connection pressure
- Avoid expensive per-request cryptographic work in application code

## Distributed sources

Per-IP controls alone are insufficient. Use autonomous-system, subnet, identity, token, endpoint-cost, or upstream reputation controls carefully. Never assume IP address equals human/user identity.
