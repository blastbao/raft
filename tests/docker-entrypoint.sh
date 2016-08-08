#!/bin/bash
set -e

CFG="-r 1:server1:6000 -r 2:server2:6000 -r 3:server3:6000"
if [ "$ROLE" = 'client' ]; then
	sleep 15
	exec bin/client -k $CLIENTKEY $CFG 2>> /tmp/client-$CLIENTKEY.log
elif [ "$ROLE" = 'server' ]; then
	sleep 10
	exec bin/server -i $SERVERID $CFG 2>> /tmp/server-$SERVERID.log
else
	echo "please specify either 'client' or 'server' in \$ROLE"
	exit 1
fi