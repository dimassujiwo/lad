# Deployment guide

## 1. Baseline

Record normal peak values for:

- packets/sec and bits/sec
- TCP established connections
- SYN rate
- conntrack entries
- requests/sec
- request latency and error rate
- CPU, memory, NIC drops

## 2. Kernel settings

Review `configs/sysctl/99-anti-ddos.conf`. Values are intentionally conservative examples, not universal production values.

Apply temporarily first:

```bash
sudo sysctl --system
```

Rollback by removing the file and reloading your prior sysctl configuration.

## 3. nftables

Validate before loading:

```bash
sudo nft -c -f configs/nftables/anti-ddos.nft
```

Then load:

```bash
sudo nft -f configs/nftables/anti-ddos.nft
```

Make sure SSH/management access is explicitly allowed before applying a default-drop policy.

## 4. Reverse proxy

Use the Nginx or HAProxy example only after adapting:

- trusted proxy/CDN networks
- application paths
- legitimate request rates
- WebSocket/streaming endpoints
- health checks
- internal/private networks

## 5. Failure handling

Keep an out-of-band console. Test recovery after a reboot. Monitor packet drops and application latency; a mitigation that causes self-inflicted denial of service is a failed mitigation.
