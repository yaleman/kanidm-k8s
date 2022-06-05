#!/bin/bash

if [ -z "$1" ]; then
    echo "Please specify a filename to deploy"
    exit 1
else
    if [ ! -f "$1" ]; then
        echo "Couldn't find {$1}, bailing!"
        exit 1
    fi
fi

#shellcheck disable=SC1091
source .env

envsubst < "$1" | kubectl apply -f -
