#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: mtr.sh <ip>"
fi

mtr --report -c 5 -i 1 --json --no-dns ${1} | jq -M -c . | tee -a /tmp/mtr.log | nc ${OUT_HOST} ${OUT_PORT}
