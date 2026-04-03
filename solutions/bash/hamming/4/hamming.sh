#!/usr/bin/env bash

main () {
  if (($# != 2)); then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
  fi
  
  string1=$1
  string2=$2
    
  if ((${#string1} != ${#string2})); then
    echo strands must be of equal length
    exit 1
  fi
  
  ham=0
  length=${#string1}
  for ((idx = 0; idx < length; ++idx)) do
    if [[ "${string1:idx:1}" != "${string2:idx:1}" ]]; then
      ((ham++))
    fi
  done
  echo $ham
}

main "$@"
