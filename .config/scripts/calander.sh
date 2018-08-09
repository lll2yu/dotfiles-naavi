#!/bin/bash
# Use ps and grep to check if the program is running
ps -ef | grep -v grep | grep gsimplecal
if [ $? -eq 1 ]
then
	gsimplecal &
else
	killall gsimplecal &
fi
