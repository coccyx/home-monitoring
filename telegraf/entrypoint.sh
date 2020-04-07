#!/bin/bash
set -e

if [ "$1" == "start" ]; then
    telegraf --config /etc/telegraf/telegraf.conf
fi

exec "$@"
