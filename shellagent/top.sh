#!/bin/sh

# TODO 
# normalize to per-core metrics; ProcPS top divides CPU consumption by the number of cores. Consider collecting at least the number of cores for downstream systems to interpret.

DIR=`dirname $0`

export _SHAGENT_COMMAND=top

# TODO cache this?
_TOPV=$(top -h | grep procps | wc -l)
if [ "${_TOPV}" -eq 1 ]; then
    export _SHAGENT_COMMVER=procps
fi

if [ -z "${_SHAGENT_COMMVER}" ]; then
    _TOPV=$(top -h | grep BusyBox | wc -l)
    if [ "${_TOPV}" -eq 1 ]; then
        export _SHAGENT_COMMVER=busybox
    fi
fi

top -bn2 | ${DIR}/output.sh
