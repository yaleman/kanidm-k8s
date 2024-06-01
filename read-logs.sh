#!/bin/bash

kubectl logs \
    "pods/$(kubectl get pods -n kanidmd -o json | jq -r '.items[0].metadata.name')"
