#!/bin/bash

: ${PG_DOCK_FROM?Need a PG_DOCK_FROM}

supervisorctl stop foo:postgres foo:repmgrd

set -e

rm -rf /var/lib/postgresql/data/*
repmgr \
	-h $PG_DOCK_FROM \
	-U repmgr \
	-d repmgr \
	-D /var/lib/postgresql/data \
	-c \
	-v \
standby clone

supervisorctl start foo:postgres foo:repmgrd