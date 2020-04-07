#!/bin/sh

DIR="$(dirname $0)"
if [ -f ${DIR}/config.sh ]; then
    . ${DIR}/config.sh
fi

if [ -z "${SHAGENT_DEST}" ]; then
    echo "Must set SHAGENT_DEST env var to host:port for destination"
    exit 1
fi

if [ $# -ge 1 -a "$1" = "--debug" ] ; then
    if [ -z "${_SHAGENT_LOG}" ]; then
        _SHAGENT_LOG=/dev/stderr
    fi
else
    _SHAGENT_LOG=/dev/null
fi

export SHAGENT_LOG=${_SHAGENT_LOG}
