#!/bin/bash

: ${PG_DOCK_NODE?Need a PG_DOCK_NODE}
: ${PG_DOCK_CONF_IMAGE?Need a PG_DOCK_CONF_IMAGE}

set -e

echo "Removing old config..."
rm -rf pg-dock-conf-$PG_DOCK_NODE
echo "Copying fresh config..."
cp -fR ../pg-dock-conf/$PG_DOCK_NODE pg-dock-conf-$PG_DOCK_NODE
echo "Copying shared config"
cp -fR ../pg-dock-conf/shared/* pg-dock-conf-$PG_DOCK_NODE/
echo "Start building the config image: $PG_DOCK_CONF_IMAGE"
docker build \
  --build-arg NODE=$PG_DOCK_NODE \
  --no-cache \
  --force-rm \
	-t $PG_DOCK_CONF_IMAGE \
	-f Dockerfile .

echo "Done!"