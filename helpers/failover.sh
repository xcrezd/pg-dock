#!/bin/bash
set -e

echo "running failover"
bash config/failover/failover.sh
repmgr standby promote