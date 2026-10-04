# XDP/eBPF option

For very high packet rates, XDP can discard traffic before the normal Linux networking stack. This repository intentionally does not ship a generic drop-all XDP program because a wrong program can lock out legitimate traffic or bypass required protocol handling.

Typical production uses:

- Drop known abusive source prefixes from a managed set
- Drop traffic to unused destination ports
- Enforce a bounded packet-rate policy for a narrowly defined service
- Export packet counters/maps for telemetry

Operational requirements:

1. Compile and test against the exact kernel/NIC driver.
2. Keep a rollback path via console.
3. Pin maps only when lifecycle is understood.
4. Measure CPU/packet-rate impact before and after deployment.
5. Coordinate XDP rules with nftables and upstream filtering.
