#!/bin/bash

KEYS=("--all" "--target")
DESCRIPTION=(
	"The --all key displays the IP addresses and symbolic names of all hosts in the current subnet."
	"The --target key displays a list of open system TCP ports.")

NMAP="nmap"

script_description () {
	echo "Possibale keys is:"
	for i in ${!KEYS[@]}; do
		echo "${KEYS[$i]} ${DESCRIPTION[$i]}"
	done
}

show_hosts_in_subnet () {
	IP=`hostname -I`
	nmap -sn $IP
}

show_open_tcp_ports () {
	nmap localhost | grep tcp
}

if [ $# -ne 1 ];
then
	script_description
fi

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

