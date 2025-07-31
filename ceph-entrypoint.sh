#!/bin/bash
set -euo pipefail

echo "[ENTRYPOINT] Starting Ceph RGW single-node bootstrap..."

# Wait for environment readiness
sleep 5

# Bootstrap a single-node Ceph cluster
cephadm bootstrap \
  --mon-ip "$(hostname -I | awk '{print $1}')" \
  --single-host-defaults \
  --image quay.io/ceph/ceph:v18.2.7

# Enable RGW orchestrator module
ceph mgr module enable rgw

# Deploy RADOS Gateway service on this host
ceph orch apply rgw local-rgw --placement="1 $(hostname)" --port=8080

echo "[ENTRYPOINT] Ceph RGW deployed. Logs follow..."

exec cephadm shell