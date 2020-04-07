#!/bin/sh

DIR="$(dirname $0)"

export _SHAGENT_COMMAND=cat_proc_stat
# export _SHAGENT_COMMVER=kilobytes

cat /proc/stat | ${DIR}/output.sh
