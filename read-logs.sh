#!/bin/bash


# shellcheck disable=SC1091
source .env

kubectl logs -n "${NAMESPACE}" \
    "pods/$(kubectl get pods -n "${NAMESPACE}" -o json | jq -r '.items[0].metadata.name')"
