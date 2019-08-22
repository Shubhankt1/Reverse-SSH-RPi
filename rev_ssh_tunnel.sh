#!/bin/bash
function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

createTunnel() {
  echo IP is $1
  /usr/bin/ssh -fN -R 2222:localhost:22 pi@$1
  if [[ $? -eq 0 ]]; then
    echo Tunnel to jumpbox created successfully
  else
    echo An error occurred creating a tunnel to jumpbox. RC was $?
  fi
}

if [ $1 ]
then
	if valid_ip $1
	then
		/bin/pidof ssh
		if [[ $? -ne 0 ]]; then
			echo Creating new tunnel connection
			createTunnel $1
		else
			echo Tunnel already created!
		fi
	else
		echo "Usage:" $0 "<IP ADDRESS>"
                        echo "For example:" $0 192.168.1.100
	fi
else
	echo "Usage:" $0 "<IP ADDRESS>"
		echo "For example:" $0 192.168.1.100
fi
