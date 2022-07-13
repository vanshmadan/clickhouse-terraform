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

## Manual Installation

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
$ kubectl get pods -n test | grep clickhouse
clickhouse-cluster-s0-r0-0   1/1     Running   0          32m50s
clickhouse-cluster-s0-r1-0   1/1     Running   0          32m50s
```
To login to clickhouse database 

```bash
$ kubectl exec -it clickhouse-cluster-s0-r0-0 -- clickhouse-client -u <username> --password=<password> --query='select hostName()'
chi-ClickHouse-replicas-0-0-0
```


<img width="829" alt="image" src="https://user-images.githubusercontent.com/31353777/178678942-020fae74-b8e3-42ab-bf9c-4bd00d852812.png">

To expose service using port forward:
```bash
kubectl port-forward --address 0.0.0.0 --namespace test svc/clickhouse-cluster-s0-r0 8123:8123 
```

## Superset

1) change directory and modify the parameter values in the `values.yaml`.
```bash
cd superset
```
2) Run below tf commands
```bash
terraform init
terraform plan
terraform apply
```
3) ## Verfication
```bash
$ kubectl get pods -n test | grep superset
```
<img width="739" alt="image" src="https://user-images.githubusercontent.com/31353777/178700418-3f965303-7e85-4f35-9ff4-2888751658bd.png">

4) To expose service
```bash
kubectl port-forward superset-xxxx-yyyy :8088 
```

Connect superset with clickhouse

1) Within Superset, select Data from the top menu and then Databases from the drop-down menu. Add a new database by clicking the + Database button:
2) In the first step, select ClickHouse Connect as the type of database
3) Add DB details like host,port,name,password and click on connect
4)
<img width="703" alt="image" src="https://user-images.githubusercontent.com/31353777/178709810-1414db6c-00ee-48e4-a24a-1175a85e31ca.png">
<img width="499" alt="image" src="https://user-images.githubusercontent.com/31353777/178709895-adbc97c4-2f51-4699-9905-2f033357f1bc.png">
<img width="709" alt="image" src="https://user-images.githubusercontent.com/31353777/178709928-c3ab7e2e-6c44-4353-a276-3fabea1e3187.png">
<img width="1425" alt="image" src="https://user-images.githubusercontent.com/31353777/178717427-e4ba4497-7bff-49aa-84a4-5dc16f435898.png">


