#!/bin/bash
for ((i=1; i<=255; i++))
do
	ip addr add 10.43.10.$i/24 dev eth0
done
