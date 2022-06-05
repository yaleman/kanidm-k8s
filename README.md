# kanidm-k8s

Example deployment of the kanidm server in k8s. I'm testing this on k3s, using the "devel" image auto-built from github.

## Deployment

1. Clone the repository
2. Check the configuration file (`server.toml`). It's a configuration map which we'll load into k8s.
3. Create a `.env` file to set environment variables for deployment
4. Deploy the configuration by running `deploy.sh`
5. Set the admin password:

```
sudo kubectl exec -it \
    pods/$(sudo kubectl get pods -n default -o json | jq -r '.items[0].metadata.name') -- \
    /sbin/kanidmd  recover_account -c /data/server.toml -n admin
```

6. Restart the service afterwards to make the admin password update stick:

```
sudo kubectl rollout restart deployments.apps/kanidmd
```
