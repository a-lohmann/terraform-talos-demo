terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}

provider "kubernetes" {
  config_path = "../../configs/kubeconfig-${terraform.workspace}.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "../../configs/kubeconfig-${terraform.workspace}.yaml"
  }
}
