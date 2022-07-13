resource "helm_release" "superset" {
  chart      = "superset"
  repository = "https://apache.github.io/superset"
  name       = "superset"
  wait       = false 
  values = [
   "${file("${path.module}/values.yaml")}"  ## Required only if different values.yaml file is created
   ]
}
