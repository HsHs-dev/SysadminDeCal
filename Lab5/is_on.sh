#!/bin/bash

# Throws away stdout so "OK" or "Host is not reachable" appears clean
ping -c 1 "$1" >/dev/null

if [ $? -eq 0 ]; then
  echo "OK"
  exit 0
else
  echo "Host is not reachable"
  exit 1
fi
