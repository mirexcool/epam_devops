#! /bin/bash

SOURCE=$1

TARGET=$2

#Before coppying new files clear old backup
rm -r $TARGET

#Copyiing folders
cp -r $SOURCE/. $TARGET

#Go to destination folder
cd $SOURCE

PWD=`pwd`
#Show where we will be loggining
echo Logging directory is: $PWD

#Check if "inotify-tools" is present on system
INOTIFY=`apt list --installed | grep inotify-tools | wc -l`

#Install notify tool
if [ $INOTIFY -lt 1 ]
then
	echo Installing notifiing tool. . .
	sudo apt install -y inotify-tools
fi

#Check if there are no runnig script "section_C.sh" and kill it
script_name="section_C.sh"
for pid in $(pidof -x $script_name); do
    if [ $pid != $$ ]; then
        kill -9 $pid
    fi
done

#Start watching at folder and save loggs to the same folder in file "folder_log.txt"
while true; do

LOG=`inotifywait -e modify,create,delete,move -r $1`
echo $LOG `date` >> $1/folder_log.txt
done

#Wited by mirexcool
