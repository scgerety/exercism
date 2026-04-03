#!/usr/bin/env bash

if [ $# = 0 ]; then
  yourname="you"
else
  yourname=$1
fi

echo "One for $yourname, one for me."
