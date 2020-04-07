#!/bin/sh

DIR="$(dirname $0)"
. ${DIR}/df.sh $* &
. ${DIR}/procdiskstats.sh $* &
. ${DIR}/procstat.sh $* &
. ${DIR}/top.sh $* &
wait
