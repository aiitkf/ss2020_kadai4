#!/bin/bash

# ------------------------------------------------------
# Argument check
ARGS=2
readonly ARGS
E_BADARGS=85

if [[ $# != "$ARGS" ]]
then
  echo "Usage: $(basename "$0") first-natural-number second-natural-number"
  exit $E_BADARGS
fi

if [[ ! $1-1 -lt $1 || ! $2-1 -lt $2 ]]
then
  echo "Usage: $(basename "$0") first-natural-number second-natural-number"
  exit $E_BADARGS
fi
# ------------------------------------------------------

gcd_euclid()
{
  a=$1
  b=$2

  while [[ $b != 0 ]]
  do
    r=$((a%b))
    a=$b
    b=$r
  done
  echo "$a"
}

gcd_euclid "$1" "$2"

