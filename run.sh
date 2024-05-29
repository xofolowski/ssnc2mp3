#!/bin/sh
#while [ ! -f /var/run/avahi-daemon/pid ]; do
#  echo "Warning: avahi is not running, sleeping for 1 second before trying to start shairport-sync"
#  sleep 1
#done
#/usr/local/bin/ssnc2mp3.sh &
#echo "Starting shairport-sync"
## pass all commandline options to shairport-sync
#/usr/local/bin/shairport-sync "$@"
/usr/local/bin/ssnc2mp3.sh 
