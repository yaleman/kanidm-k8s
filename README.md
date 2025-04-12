# kanidm-k8s

Example deployment of the kanidm server in k8s. I'm testing this on orbstack, using release builds.

## Deployment

You'll need an ingress controller.

1. Clone the repository
2. Check the configuration file (`server.toml`) in `kanidmd.yaml`. It's a configuration map which we'll load into k8s.
3. Create a `.env` file to set environment variables for deployment
4. Deploy the configuration by running `deploy.sh`
5. Set the admin password:

```shell
kubectl exec -it \
    pods/$(kubectl get pods -n kanidmd -o json | jq -r '.items[0].metadata.name') -- \
    /sbin/kanidmd recover_account -c /data/server.toml -n admin
```
