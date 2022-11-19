#!/bin/bash

while true; do

LOG=`inotifywait -e modify,create,delete,move -r $1`
echo $LOG `date` >> $1/folder_log.txt
done
