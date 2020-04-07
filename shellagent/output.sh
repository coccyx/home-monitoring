#!/bin/sh

if [ -z "${_SHAGENT_COMMAND}" ]; then
    echo "\$_SHAGENT_COMMAND is not set"
    exit 1
fi

_out="***CRIBL*** command=${_SHAGENT_COMMAND}"
if [ -n "${_SHAGENT_COMMVER}" ]; then
    _out="${_out} commver=${_SHAGENT_COMMVER}"
fi

OLDIFS=${IFS}
IFS=
_cmdout=$(cat /dev/stdin)
_out=$(printf '%s\n%s\n' "${_out}" "${_cmdout}")
echo ${_out} | nc -w0 192.168.1.172 10002
IFS=${OLDIFS}
