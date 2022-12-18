
if [ $# -eq 0 ]; then
  echo "need atleast 1 argument"
fi

FILE_PURPOSE=MAIN

for arg in "$@"
do
  # main function, or..
  if [[ $arg == -* ]]; then
    case $arg in
      -m)
        echo "-m"
      ;;
      -f)
        echo "-f"
        ;;
    esac
  else
    touch $arg
    # .cpp
    if [[ $arg == **.cpp ]]; then
      echo $'#include <iostream>\n\nint main(){\n\treturn 0;\n}' >> $arg
    fi

    # .h
    if [[ $arg == *.h ]]; then
      echo $'#pragma once' >> $arg
    fi

    # .sh
    if [[ $arg == *.sh ]]; then
      echo $'#!/bin/bash' >> $arg
    fi
  fi
done
