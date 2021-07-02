#!/bin/bash

trap 'rm -f "$TMPFILE"' EXIT

TMPFILE=$(mktemp) || exit 1

for pid in $(nvidia-smi | grep -A 100 PID | tail -n +4 | grep '|' | awk '{print $5}'); do
    ps hao user:20,pid -q $pid  >> $TMPFILE
done

nvidia-smi
echo -e "\nuser name and pid in nvidia-smi:"
awk '{printf "%10s\t%-10s\n", $1, $2}' $TMPFILE
echo -e "\nuser statistic:"
awk '{print $1}' $TMPFILE | sort | uniq -c | sort -r
echo 
