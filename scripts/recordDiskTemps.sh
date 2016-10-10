#!/bin/bash

# Run this in some interval to record disk smart information.
# This script assumes there's a directory called /root/logs/

for D in sda sdb sdc sdd sde sdf sdg sdh sdi sdj
do
        DATE=`date +%s`
        smartctl -a /dev/$D &> /root/logs/"$D"_"$DATE".txt
        echo "$D" `cat /root/logs/"$D"_"$DATE".txt | grep -i Temperature`
done
echo "--------------------------------------------------"
