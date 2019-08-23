#!/bin/bash
screen -dm -S "pi-screen" -c '/home/pi/Reverse-SSH-RPi/screenrc'
while true; 
do
        OUTPUT="$(ps -aux | grep screen | grep -v grep | grep -v runscreenrc.sh | awk '{print $2}')"
        if [[ -z $OUTPUT ]]
        then
                screen -dm -S "pi-screen" -c '/home/pi/Reverse-SSH-RPi/screenrc'
        fi
	sleep 3;
done
