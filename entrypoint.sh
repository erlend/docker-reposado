#!/bin/sh

set -e

echo "Fixing permissions..."
sed -i "s/\(reposado:x\)\(:[^:]\+\)\{2\}/\1:$USER_ID:$GROUP_ID/" /etc/passwd
sed -i "s/\(reposado:x\):[^:]\+/\1:$GROUP_ID/" /etc/group
chown -R $USER_ID:$GROUP_ID /data

if [ -z "$1" ]; then
  echo "Creating crontab with pattern: $CRON_PATTERN"
  echo "$CRON_PATTERN repo_sync --log=/data/reposado.log" | crontab -u reposado -

  set -- crond -fl6L-
fi

exec dumb-init -c -- $@
