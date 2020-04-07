#!/bin/sh

DIR="$(dirname $0)"
. ${DIR}/common.sh

export _SHAGENT_COMMAND=df
export _SHAGENT_COMMVER=kilobytes

df -TP | ${DIR}/output.sh

export _SHAGENT_COMMVER=inodes
df -TPi | ${DIR}/output.sh
