#!/usr/bin/env bash


sqlitefile=$1

tables=`sqlite3 $sqlitefile ".tables"`
for table in $tables
do
    sqlite3 -header -csv $sqlitefile "select * from $table;" > ${sqlitefile%.*}_${table}.csv
done
