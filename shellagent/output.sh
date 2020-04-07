#!/bin/sh

if [ -z "${_SHAGENT_COMMAND}" ]; then
    echo "\$_SHAGENT_COMMAND is not set"
    exit 1
fi

_out="***CRIBL*** command=${_SHAGENT_COMMAND}"
if [ -n "${_SHAGENT_COMMVER}" ]; then
    _out="${_out} commver=${_SHAGENT_COMMVER}"
fi
_out="${_out} host=$(hostname)"

if [ -z "${SHAGENT_LOG}" ]; then
    SHAGENT_LOG=/dev/null
fi

OUT_HOST=$(echo ${SHAGENT_DEST} | cut -f 1 -d:)
OUT_PORT=$(echo ${SHAGENT_DEST} | cut -f 2 -d:)

if [ -z "${OUT_HOST}" ]; then
    echo "OUT_HOST not set. Check SHAGENT_DEST env var set to host:port"
    exit 1
fi

if [ -z "${OUT_PORT}" ]; then
    echo "OUT_PORT not set. Check SHAGENT_DEST env var set to host:port"
    exit 1
fi


OLDIFS=${IFS}
IFS=
_cmdout=$(cat /dev/stdin)
_out=$(printf '%s\n%s\n' "${_out}" "${_cmdout}")
echo ${_out} | tee -a "${SHAGENT_LOG}" | nc -w0 ${OUT_HOST} ${OUT_PORT}
IFS=${OLDIFS}
