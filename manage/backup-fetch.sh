#!/bin/bash

: ${BACKUP_NAME?Need a BACKUP_NAME}

if [ -z $STAGE ]; then
	supervisorctl stop foo:repmgrd
fi

supervisorctl stop foo:postgres

rm /var/lib/postgresql/data/postmaster.pid
/usr/bin/envdir /etc/wal-e.d/env /usr/local/bin/wal-e backup-fetch /var/lib/postgresql/data $BACKUP_NAME