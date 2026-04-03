#!/usr/bin/env bash

main () {
  (($# != 2)) && { echo "Usage: hamming.sh <string1> <string2>"; exit 1; }
  
  string1=$1
  string2=$2
    
  ((${#string1} != ${#string2})) && { echo strands must be of equal length; exit 1; }
  
  for ((ham=0, length=${#string1}, idx = 0; idx < length; ++idx)); do
    [[ "${string1:idx:1}" != "${string2:idx:1}" ]] && ((++ham))
  done
  echo $ham
}

main "$@"
