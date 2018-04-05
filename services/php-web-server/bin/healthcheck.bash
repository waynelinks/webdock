#!/usr/bin/env bash

set -e

case $ENTRYPOINT_ARGUMENT in
    '--start-web')
        service nginx status || exit 1
    ;;
esac

exit 0
