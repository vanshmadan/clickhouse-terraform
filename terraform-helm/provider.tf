terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

