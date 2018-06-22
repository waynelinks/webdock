#!/usr/bin/env bash

set -e

case $(cat /etc/docker_entrypoint_argument) in
    '--start-web')
        service nginx status || exit 1
    ;;
esac

exit 0
