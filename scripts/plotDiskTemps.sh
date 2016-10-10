#!/bin/bash

# This script assumes a directory "logs" containing files of the name "NAME_UNIXTIME.txt"
# where name is the disk name, such as sda, and unixtime is a unix timestamp.
# The file should contain the content of smartctl -a /dev/NAME
# The resulting plot.txt file instructs gnuplot to plot the temperature versus time.
# It can be loaded in the gnuplot cli with the command: load "plot.txt"

LT=0

echo "Writing to plot.txt"

echo 'set timefmt "%s"' >> plot.txt
echo 'set xdata time' >> plot.txt
echo 'plot \' > plot.txt


# Upda this with the disks you have logs for.

for D in sdb sdc sdd sde sdf sdg sdh sdi sdj
do

	((LT++))

	echo "Writing $D.txt"
	for F in logs/$D*
	do
		TS=${F:9:10}
		TEMP=`cat $F | grep -i temperature | tr -s ' ' | cut -d ' ' -f 10`
		echo -e "$TS\t$TEMP" >> "$D.txt"
	done

	echo "Writing to plot.txt"
	echo "\"$D.txt\" using 1:2 title '$D' with lines linetype $LT, \\" >> plot.txt
done
