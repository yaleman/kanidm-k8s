#!/bin/bash

# shellcheck disable=SC1091
source ".env"

if [ -z "${K8S_CLUSTER}" ]; then
  echo "K8S_CLUSTER is not set"
  exit 1
fi

if [ "$(kubectl config current-context)" != "$K8S_CLUSTER" ]; then
  echo "Switching to $K8S_CLUSTER"
  kubectl config use-context "$K8S_CLUSTER"
fi

# remove the deployment
kubectl delete deployment.apps/kanidmd -n kanidmd

# remove the pv / pvc
kubectl delete pvc/kanidmd-db -n kanidmd
kubectl delete pv/kanidmd-db

# remove the service
kubectl delete service/kanidmd -n kanidmd

# remove the namespace
kubectl delete namespace kanidmd

echo "Done!"