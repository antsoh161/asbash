#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No arguments supplied"
fi

for i
do
    touch $i
    echo $'#include <iostream>\n\n int main()\n{\n\treturn 0;\n}' >> $i
done


