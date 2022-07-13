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

## Install Terraform
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Installtion using terraform

1) change directory and modify the parameter values in the `values.yaml`.
```bash
cd clickhouse-helm-terraform
```
2) Run below tf commands
```bash
terraform init
terraform plan
terraform apply
```
For persistent storage configuration, add below values in values.yaml
```bash
 defaultStorageClassName: standard
 defaultStorageResourceRequest: 10Gi
```

## Manual Installtion

If you need to customize many parameters, you can modify [values.yaml](../clickhouse-cluster-helm/values.yaml).

1. Download the `values.yaml` file.
2. Modify the parameter values in the `values.yaml`.
3. Run the following command to deploy the cluster.

```bash
$ helm install --generate-name <repoName>/clickhouse-cluster -n <nameSpace>\
  -f /<path>/to/values.yaml
```


## Verfication
``` bash
kubectl get pods -n test
```


**Expected output**

```bash
$ kubectl get pods | grep clickhouse
clickHouse-replicas-0-0-0   1/1     Running   0          32m50s
clickHouse-replicas-0-1-0   1/1     Running   0          32m50s

$ kubectl exec -it chi-ClickHouse-replicas-0-0-0 -- clickhouse-client -u clickhouse --password=c1ickh0use0perator --query='select hostName()'
chi-ClickHouse-replicas-0-0-0
```

<img width="829" alt="image" src="https://user-images.githubusercontent.com/31353777/178678942-020fae74-b8e3-42ab-bf9c-4bd00d852812.png">


Superset

