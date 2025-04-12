#!/bin/bash

set -e

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

if [ -z "${K8S_CLUSTER}" ]; then
  echo "K8S_CLUSTER is not set"
  exit 1
fi

if [ "$(kubectl config current-context)" != "$K8S_CLUSTER" ]; then
  echo "Switching to $K8S_CLUSTER"
  kubectl config use-context "$K8S_CLUSTER"
fi

if [ ! -d "/tmp/kanidm-k8s" ]; then
  echo "Creating /tmp/kanidm-k8s for mounting just in case"
  mkdir -p /tmp/kanidm-k8s
fi

if [ -z "${DEBUG}" ]; then
  DEBUG=0
fi

if [ "${DEBUG}" -eq 1 ]; then
  echo "DEBUG is set, showing envsubst output"
envsubst < "$1"

  echo "####################"
fi


envsubst < "$1" | kubectl apply -f -
