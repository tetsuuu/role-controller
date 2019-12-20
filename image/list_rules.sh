#!/bin/bash

LISTS=("$(aws events list-rules \
  --page-size 10 \
  --query 'Rules[].Name' \
  --output text \
   | tr "\t" "\n" \
   | grep staging)")

disable() {
  for target in $LISTS; do
    aws events disable-rule --name $target
  done
}

enable() {
  for target in $LISTS; do
    aws events enable-rule --name $target
  done
}

if [ $1 = 'enable' ]; then
  enable
elif [ $1 = 'disable' ]; then
  disable
fi