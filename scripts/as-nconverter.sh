#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Exactly 2 arguments required"
  exit 0
fi

if [[ $2 != --* ]]; then
	echo "Run script as: ./as-nconverter <number> <--type>"
	exit 0
fi

val=$1
ntype=$2

case $ntype in 
	--dec)
		echo "Dec: $val"
		echo -n 'Hex: ' 
		echo "obase=16; ibase=10; $val" | bc
		echo -n 'Bin: '
		echo "obase=2; ibase=10; $val" | bc
		;;
	--hex)
		echo "Hex: $val"
		echo -n 'Dec: ' 
		echo "obase=10; ibase=16; $val"|bc
		echo -n 'Bin: '
		echo "obase=2; ibase=16; $val" | bc
		;;
	--bin)
		echo "Bin: $val"
		echo -n 'Dec: '
		echo "obase=10; ibase=2; $val" | bc
		echo -n 'Hex: '
		echo "obase=16; ibase=2; $val" | bc
		;;
esac
