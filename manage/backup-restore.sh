#!/bin/bash

set -e

supervisorctl stop foo:postgres foo:repmgrd

cat << EOF > /var/lib/postgresql/data/recovery.conf
# The command that will be executed while recovering
restore_command = 'envdir /etc/wal-e.d/env /usr/local/bin/wal-e wal-fetch "%f" "%p"'
 
# You can specify this value with exact time. This will be useful if
# you have incident and you want to recover to a few moments before.
# recovery_target_time = '2016-06-02 06:18:00'
recovery_target_timeline = latest
EOF

supervisorctl start foo:postgres foo:repmgrd
