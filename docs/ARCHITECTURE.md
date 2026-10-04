# Architecture

```text
Internet
   |
   |  Upstream ACL / CDN / scrubbing (preferred for volumetric attacks)
   v
+----------------------+
| Linux NIC / driver   |
+----------------------+
   |
   | XDP/eBPF (optional, very early filtering)
   v
+----------------------+
| nftables / conntrack |
+----------------------+
   |
   | TCP/UDP/ICMP policy, connection limits
   v
+----------------------+
| Nginx / HAProxy      |
+----------------------+
   |
   | request rate/conn limits, timeouts
   v
+----------------------+
| Application          |
+----------------------+
   |
   +--> Fail2ban / logs / metrics / alerting
```
