#!/usr/bin/env bash

confirmed=false

while [ $confirmed = false ]; do
    read -r -p "Are You Sure? [Y/n] " input

    case $input in
        [yY][eE][sS]|[yY])
            confirmed=true
        ;;

        [nN][oO]|[nN])
            echo "Command interrupted."
            exit 1
        ;;

        *)
            echo "Invalid answer, let's try again:"
        ;;
    esac
done
