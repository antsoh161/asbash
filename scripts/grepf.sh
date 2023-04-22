#!/bin/bash

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 [<path>] <pattern>"
  exit 1
fi

if [[ $# -eq 1 ]]; then
  path="."
  pattern="$1"
else
  path="$1"
  pattern="$2"
fi

if [[ ! -d "$path" ]]; then
  echo "Error: \"$path\" is not a directory."
  exit 1
fi

if [[ -z "$pattern" ]]; then
  echo "Error: No pattern provided."
  exit 1
fi

grep -rniw "$path" -e "$pattern" --color=always
