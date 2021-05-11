#!/bin/bash

trap 'rm -f "$TMPFILE"' EXIT

TMPFILE=$(mktemp) || exit 1

for pid in $(nvidia-smi | grep -A 100 PID | tail -n +4 | grep '|' | awk '{print $5}'); do
    ps axo user:20,pid,pcpu,pmem,vsz,rss,tty,stat,start,time,comm | grep $pid | grep -v $USER | awk '{print $1 "\t" $2}' >> $TMPFILE
done

nvidia-smi
echo -e "\nuser name and pid in nvidia-smi:"
cat $TMPFILE
echo -e "\nuser statistic:"
cut -d $'\t' -f 1 $TMPFILE | sort | uniq -c | sort -r
echo 
