#!/bin/bash

#shellcheck disable=SC1091
source .env

envsubst < kanidmd.yaml | kubectl apply -f -
