resource "helm_release" "clickhouse" {
  chart      = "clickhouse-cluster"
  repository = "https://radondb.github.io/radondb-clickhouse-kubernetes/"
  name       = "clickhouse-cluster"
  namespace  = "test"
  version    =  "1.0"
  wait       = false 
  values = [
   "${file("${path.module}/values.yaml")}"  ## Required only if different values.yaml file is created
   ]
}
