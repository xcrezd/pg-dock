#!/bin/bash

# this script should be run from host

: ${PG_DOCK_NODE?Need a PG_DOCK_NODE}
    
docker run -t \
  -e S3_REGION=$S3_REGION \
  -e S3_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID \
  -e S3_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY \
  -e S3_BUCKET=$S3_BUCKET \
  -e POSTGRES_DATABASE=$POSTGRES_DATABASE \
  -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  -e S3_PREFIX="pg-dock-$PG_DOCK_NODE" \
  -e POSTGRES_HOST="pg-dock-$PG_DOCK_NODE" \
  schickling/postgres-restore-s3