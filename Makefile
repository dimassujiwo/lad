.PHONY: check nft-check health

check:
	bash tests/static-check.sh

nft-check:
	nft -c -f configs/nftables/anti-ddos.nft

health:
	bash scripts/health-check.sh
