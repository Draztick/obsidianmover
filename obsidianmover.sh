#!/bin/bash

MONITOR=$1
DEST=$2
SEARCH=$3

if [[ $SEARCH == "all" ]]; then
    while true;
    do
        for i in $(find $MONITOR -type f);
        do
            iscomplete=$(cat $i | grep "#complete" | wc -w);
        
            if [ $iscomplete -gt 0 ]; then
                mv $i $DEST;
            fi
        done
        sleep 15;
    done
elif [[ $SEARCH == "markdown" ]]; then
    while true;
    do
        for i in $(find $MONITOR -type f -name '*.md');
        do
            iscomplete=$(cat $i | grep "#complete" | wc -w);
        
            if [ $iscomplete -gt 0 ]; then
                mv $i $DEST;
            fi
        done
        sleep 15;
    done
else
    echo "Invalid Use."
    echo "Usage: ./obsidianmover.sh MONITOR_DIR MOVE_DIR [markdown|all]"
    echo "MONITOR_DIR - The directory you wish to monitor for the added #complete tag."
    echo "MOVE_DIR - When the #complete tag is added, move the file to this directory."
    echo "[markdown|all] Choose one. More to come."
fi
