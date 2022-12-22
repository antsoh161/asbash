#!/bin/bash
asb_path="$XDG_CONFIG_HOME/asbash/scripts"
alias as-nconverter='$asb_path/as-nconverter.sh'
alias astouch='$asb_path/astouch.sh'
alias grepf='$asb_path/grepf.sh'

function dotdot() {

  if [[ $# -ne 1 ]]; then
    echo "Exactly one argument required eg. .. <n>"
    exit 1
  fi

  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]]; then
    echo "Bad input, argument should be an integer"
    exit 1
  fi



  for i in $(seq $1);
  do
    cd ../ 
    echo "going up.."
  done

}
alias ..=dotdot
