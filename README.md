# kanidm-k8s

Example deployment of the kanidm server in k8s.

## Deployment

1. Clone the repository
2. Check the configuration file (`server.toml`). It's a configuration map which we'll load into k8s.
3. Create a `.env` file to set environment variables for deployment
3. Deploy the configuration by running `deploy.sh`


Setting the admin password:

```
sudo kubectl exec -it \
    pods/$(sudo kubectl get pods -n default -o json | jq -r '.items[0].metadata.name') -- \
    /sbin/kanidmd  recover_account -c /data/server.toml -n admin
```

Restarting the service afterwards:

```
sudo kubectl rollout restart deployments.apps/kanidmd
```


 v8Tusy2QQPwP0JaWwKcNeVAzW1ZD9zc77HfKy3yMCU5uFGjD
