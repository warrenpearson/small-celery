#!/bin/bash

PID=`ps -ef |grep "my_tasks.celery flower" |grep -v grep |awk '{ print $2 }'`

if [ -z "${PID}" ]; then
    echo "No flower process running"
else
    echo "Shutting down flower process ${PID}"
    kill ${PID}
fi
