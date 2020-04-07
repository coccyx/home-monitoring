#!/bin/sh

DIR="$(dirname $0)"

export _SHAGENT_COMMAND=cat_proc_diskstats

cat /proc/diskstats | ${DIR}/output.sh
