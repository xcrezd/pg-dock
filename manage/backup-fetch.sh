#!/bin/bash

: ${BACKUP_NAME?Need a BACKUP_NAME}

supervisorctl stop foo:postgres foo:repmgrd
/usr/bin/envdir /etc/wal-e.d/env /usr/local/bin/wal-e backup-fetch /var/lib/postgresql/data $BACKUP_NAME