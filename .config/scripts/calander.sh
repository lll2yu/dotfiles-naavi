#!/bin/bash
# Use pgrep to check if the program is running
pgrep -x gsimplecal
if [ $? -eq 1 ]
then
	gsimplecal &
else
	killall gsimplecal &
fi
