resource "helm_release" "clickhouse" {
  chart      = "clickhouse-cluster"
  repository = "https://radondb.github.io/radondb-clickhouse-kubernetes/"
  name       = "clickhouse-cluster"
  namespace  = "test"
  version    =  "1.0"

  set {
    name  = "defaultStorageClassName"
    value = "standard"
  }

  set {
    name  = "defaultStorageResourceRequest"
    value = "1Gi"
  }  
}
