#!/bin/sh

DIR="$(dirname $0)"
. ${DIR}/common.sh

export _SHAGENT_COMMAND=cat_proc_diskstats

cat /proc/diskstats | ${DIR}/output.sh
