#!/bin/bash

set -e

: ${PG_DOCK_CONF_IMAGE?Need a PG_DOCK_CONF_IMAGE}


echo "Updating config files at host machine"
docker run --rm -t -v /opt/pg-dock/scripts:/etc/scripts ${PG_DOCK_CONF_IMAGE}