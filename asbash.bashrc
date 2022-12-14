#!/bin/bash
asb_path="$XDG_CONFIG_HOME/asbash/scripts"
alias asnconv='$asb_path/as-nconverter.sh'
alias astouch='$asb_path/astouch.sh'
alias grepf='$asb_path/grepf.sh'

function dotdot() {

  if [[ $# -ne 1 ]]; then
    echo "Exactly one argument required eg. .. <n>"
    return 1
  fi

  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]]; then
    echo "Bad input, argument should be an integer"
    return 1
  fi

  for i in $(seq $1);
  do
    cd ../ 
  done
}
alias ..=dotdot

function find_and_cd() {
  if [[  $# -ne 1 ]]; then
    echo "Exactly one arguments required eg. <foldername>"
    exit 1
  fi

  FOUND=$(find . -type d -name $1)  #| wc -l)
  if [[ -z $FOUND ]]; then
    echo "directory does not exist in cwd tree"
    exit 1
  fi

  LINES=$(echo "$FOUND" | wc -l)

  if [[ $LINES -ne 1 ]]; then
    echo "Found more than one target, cd yourself"
    echo "$FOUND"
  else
    echo "cding into.."
    echo $FOUND
    cd $FOUND
  fi
}
alias findcd=find_and_cd

