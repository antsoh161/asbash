#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Exactly 2 arguments required"
  exit 0
fi

if [[ $2 != --* ]]; then
	echo "Run script as: ./as-nconverter <number> <--type>"
	exit 0
fi

#for i
#do
#  if [[ $i == --* ]]; then
#    if [[ -v ntype ]]; then
#      echo 'Only pass one "--type" argument'
#      exit 0
#    fi
#    ntype=$i
#  else
#    val=$i
#  fi
#done
#
#if [[ $ntype == '--dec' ]]; then
# echo 'a' 
#fi

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


#if [ $# -ne 1 ]; then
#  echo "This script only accepts 1 argument"
#fi




