#!/usr/bin/env bash

PLING=""
PLANG=""
PLONG=""

num=$1

if [ $(($num % 3)) -eq 0 ]; then 
  PLING="Pling"
fi
if [ $(($num % 5)) -eq 0 ]; then 
  PLANG="Plang" 
fi
if [ $(($num % 7)) -eq 0 ]; then 
  PLONG="Plong" 
fi

plng=$PLING$PLANG$PLONG

if [ ${#plng} = 0 ]; then
  echo "$num"
else
  echo $plng
fi
