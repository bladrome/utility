#!/usr/bin/env bash


sqlitefile="KEGG.sqlite"

tables=`sqlite3 $sqlitefile ".tables"`
for table in $tables
do
    sqlite3 -header -csv $sqlitefile "select * from $table;" > $table.csv
done
