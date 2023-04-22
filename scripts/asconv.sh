#!/bin/bash

function convert {

  val=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  ntype="$2"

  case "$ntype" in
    --dec)
      if ! [[ $val =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid input \"$val\". Must be a decimal number."
        return 1
      else
        echo "Dec: $val"
        echo "Hex: $(echo "obase=16; ibase=10; $val" | bc)"
        echo "Bin: $(echo "obase=2; ibase=10; $val" | bc)"
      fi
      ;;
    --hex)
      if ! [[ $val =~ ^[0-9A-Fa-f]+$ ]]; then
        echo "Error: Invalid input \"$val\". Must be a hexadecimal number."
        return 1
      else
        echo "Hex: $val"
        echo "Dec: $(echo "obase=10; ibase=16; $val" | bc)"
        echo "Bin: $(echo "obase=2; ibase=16; $val" | bc)"
      fi
      ;;
    --bin)
      if ! [[ $val =~ ^[01]+$ ]]; then
        echo "Error: Invalid input \"$val\". Must be a binary number."
        return 1
      else
        echo "Bin: $val"
        echo "Dec: $(echo "obase=10; ibase=2; $val" | bc)"
        echo "Hex: $(echo "obase=16; ibase=2; $val" | bc)"
      fi
      ;;
    *)
      echo "Error: Invalid type \"$ntype\". Must be \"dec\", \"hex\", or \"bin\"."
      return 1
      ;;
  esac

}

if [[ $# -eq 1 ]] && [[ $1 == "--run" ]]; then
  echo "Enter <number> <--type>"
  while true; do
    read -a args 
    if [[ "${args[0]}" == "q" ]]; then
      break
    fi
    if [[ "${#args[@]}" -eq 2 ]]; then
      convert "${args[0]}" "${args[1]}"
    else
      echo "Error: Expected number --type"
    fi
  done
else
  convert "${@}"
fi
