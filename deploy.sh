#!/bin/bash

#shellcheck disable=SC1091
source .env

envsubst < kanidmd.yml | kubectl apply -f -
