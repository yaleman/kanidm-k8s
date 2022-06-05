# kanidm-k8s

Example deployment of the kanidm server in k8s.

## Deployment

1. Clone the repository
2. Check the configuration file (`server.toml`). It's a configuration map which we'll load into k8s.
3. Deploy the configuration: `kubectl apply -f kanidmd.yaml`
