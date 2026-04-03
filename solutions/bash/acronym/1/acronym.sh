#!/usr/bin/env bash

main () {
  acronym=""
  phrase=$1
  phrase="${phrase//\'/}"
  phrase="${phrase//[[:punct:]]/ }"
  for word in $phrase
  do
    acronym="$acronym""${word:0:1}"
  done
  acronym=$(echo "$acronym" | tr '[:lower:]' '[:upper:]')
  echo "$acronym"
}

main "$@"
