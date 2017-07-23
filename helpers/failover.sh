#!/bin/bash
set -e

echo "running failover"
repmgr standby promote
bash config/failover/failover.sh