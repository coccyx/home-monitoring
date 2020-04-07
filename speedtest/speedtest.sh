#!/bin/sh
speedtest --json | tee -a /tmp/speedtest.log | nc ${OUT_HOST} ${OUT_PORT}