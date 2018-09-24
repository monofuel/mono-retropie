#!/bin/bash

# script to assert the share is mounted and the script is not already running

if mount | grep /mnt/mjolnir/RetroPie > /dev/null; then
    echo share mounted >> /var/log/retropie-backup.log
else
    echo share not mounted!
    exit 1
fi

LOCK_FILE=/tmp/.sync-script-lock

if [ -f $LOCK_FILE ]; then
        echo script already running!
        echo if this takes too long, consult a doctor
        echo script already running >> /var/log/retropie-backup.log
        exit
fi

echo Running sync script $(date +F) >> /var/log/retropie-backup.log

touch $LOCK_FILE

nice -n20 unison -batch retropie

rm $LOCK_FILE

echo released lock >> /var/log/retropie-backup.log
