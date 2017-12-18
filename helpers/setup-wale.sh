#!/bin/bash

# Assumption: the group is trusted to read secret information
umask u=rwx,g=rx,o=
mkdir -p /etc/wal-e.d/env

echo "$WALE_AWS_SECRET_ACCESS_KEY" > /etc/wal-e.d/env/AWS_SECRET_ACCESS_KEY
echo "$WALE_AWS_ACCESS_KEY_ID" > /etc/wal-e.d/env/AWS_ACCESS_KEY_ID
echo "$WALE_S3_PREFIX" > /etc/wal-e.d/env/WALE_S3_PREFIX
echo "$WALE_AWS_REGION" > /etc/wal-e.d/env/AWS_REGION
echo "$WALE_S3_ENDPOINT" > /etc/wal-e.d/env/WALE_S3_ENDPOINT
chown -R postgres:postgres /etc/wal-e.d