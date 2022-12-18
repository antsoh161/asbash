#!/bin/bash

if [[  $# -ne 1 ]]; then
  echo "only one argument allowed",
  exit
else
  grep -rnw . -e $1
fi

