#!/usr/bin/env bash

# TODO move BACKEND_VERSION to Dockerfile
export BACKEND_VERSION=$(cat /VERSION)

(printenv | sed 's/^\(.*\)\=\(.*\)$/export \1\=\2/g' | grep -E '^export BACKEND_') > /etc/cron-envs

crontab /etc/crontab

touch /codebase/var/logs/cron.log
cron && tail -f /codebase/var/logs/cron.log
