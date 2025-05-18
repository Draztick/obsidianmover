#!/bin/bash

MONITOR=$1
DEST=$2
SEARCH=$3

if [ $SEARCH -eq "all" ]; then
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
else;
    while true;
    do
        for i in $(find $MONITOR -type f -name "$SEARCH");
        do
            iscomplete=$(cat $i | grep "#complete" | wc -w);
        
            if [ $iscomplete -gt 0 ]; then
                mv $i $DEST;
            fi
        done
        sleep 15;
    done

