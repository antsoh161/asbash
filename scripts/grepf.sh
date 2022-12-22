#!/bin/bash

if [[  $# -ne 2 ]]; then
  echo "Exactly two arguments required eg. grepf <path> <pattern>"
  exit
else
  grep -rniw $1 -e "$2" --color=always
fi

