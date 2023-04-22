
if [ $# -eq 0 ]; then
  echo "need atleast 1 argument"
  exit 1
fi

FILE_PURPOSE=MAIN

for arg in "$@"
do
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

    # .py
    if [[ $arg == *.py ]]; then
      echo $'def main():\n\tprint("Hello World")\n\n\nif __name__ == "__main__":\n\tmain()' >> $arg
    fi
done
