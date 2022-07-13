## Prerequisite

## Quick start with minikube

1) Download minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube
```
2) Start minikube
```bash
minikube start --driver=docker
```


## Custom Configuration

If you need to customize many parameters, you can modify [values.yaml](../clickhouse-cluster-helm/values.yaml).

1. Download the `values.yaml` file.
2. Modify the parameter values in the `values.yaml`.
3. Run the following command to deploy the cluster.

```bash
$ helm install --generate-name <repoName>/clickhouse-cluster -n <nameSpace>\
  -f /<path>/to/values.yaml
```
