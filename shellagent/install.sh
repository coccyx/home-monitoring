#!/bin/sh
DIR="$(dirname $0)"
_resolved=$(cd ${DIR}; pwd)
_crontab1="*  *  *  *  *    ${_resolved}/agent.sh"
_crontab2="*  *  *  *  *    sleep 15 && ${_resolved}/agent.sh"
_crontab3="*  *  *  *  *    sleep 30 && ${_resolved}/agent.sh"
_crontab4="*  *  *  *  *    sleep 45 && ${_resolved}/agent.sh"
_crontab=$(printf "%s\n%s\n%s\n%s\n" "${_crontab1}" "${_crontab2}" "${_crontab3}" "${_crontab4}")
(crontab -l ; echo "${_crontab}") 2>/dev/null | sort | uniq | crontab -
