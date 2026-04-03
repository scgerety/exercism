#!/usr/bin/env bash


if [ $# -ne 2 ]; then
  echo "Usage: hamming.sh <string1> <string2>"
  exit 1
else
  string1="$1"
  string2="$2"
fi
  
if [ ${#string1} -ne ${#string2} ]; then
  echo --partial "strands must be of equal length"
  exit 1
fi

ham=0
length=${#string1}
for ((i = 0; i < length; i++)) do
  char1="${string1:i:1}"
  char2="${string2:i:1}"
  if [ $char1 != $char2 ]; then
    ((ham++))
  fi
done
echo $ham
