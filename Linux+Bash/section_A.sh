#!/bin/bash

KEYS=("--all" "--target")
DESCRIPTION=(
	"The --all key displays the IP addresses and symbolic names of all hosts in the current subnet."
	"The --target key displays a list of open system TCP ports.")

NMAP="nmap"

#Function will show script usage
script_description () {
	echo "Possibale keys is:"
	for i in ${!KEYS[@]}; do
		echo "${KEYS[$i]} ${DESCRIPTION[$i]}"
	done
}

#Function will show symbolic names of all hosts in the current subnet
show_hosts_in_subnet () {
	IP=`hostname -I`
	nmap -sn $IP
}

#Function will show all open TCP ports
show_open_tcp_ports () {
	nmap localhost | grep tcp
}

#Check if there are at least one FLAG is present
if [ $# -ne 1 ];
then
	script_description
fi

#Check all arguments with possible flags and give result
for ARG in "$@"; do
	if [ "$ARG" = "--all" ];
	then
		show_hosts_in_subnet
	fi

	if [ "$ARG" = "--target" ];
	then
		show_open_tcp_ports
	fi
done





#Writed by mirexcool
