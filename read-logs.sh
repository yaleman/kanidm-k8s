#!/bin/bash

sudo kubectl logs \
    pods/$(sudo kubectl get pods -n default -o json | jq -r '.items[0].metadata.name')
