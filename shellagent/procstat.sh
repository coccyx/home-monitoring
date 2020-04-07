#!/bin/sh

DIR="$(dirname $0)"
. ${DIR}/common.sh

export _SHAGENT_COMMAND=cat_proc_stat
# export _SHAGENT_COMMVER=kilobytes

cat /proc/stat | ${DIR}/output.sh
