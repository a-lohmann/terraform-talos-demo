module "bootstrap_talos" {
  source            = "../../modules/bootstrap_talos"

  cluster_name      = "${local.cluster_name}"
  nodes             = local.nodes
  cluster_endpoint  = local.cluster_endpoint
}

module "bootstrap_argocd" {
  source            = "../../modules/bootstrap_argocd"
  #depends_on        = [ module.bootstrap_talos.talos_cluster_health ]
}
