# kanidm-k8s

Example deployment of the kanidm server in k8s.

## Deployment

1. Clone the repository
2. Check the configuration file (`server.toml`). It's a configuration map which we'll load into k8s.
3. Create a `.env` file to set environment variables for deployment
3. Deploy the configuration by running `deploy.sh`
