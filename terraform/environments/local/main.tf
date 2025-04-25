module "bootstrap_talos" {
  source            = "../../modules/bootstrap_talos"

  cluster_name      = "${local.cluster_name}"
  nodes             = local.nodes
  cluster_endpoint  = local.cluster_endpoint
}

#module "bootstrap_argocd" {
#  source            = "../../modules/bootstrap_argocd"
#  #depends_on        = [ module.bootstrap_talos.talos_cluster_health ]
#}

#module "argocd_provision" {
#  source            = "../../modules/argocd_provisioning"
##  #depends_on        = [ module.bootstrap_talos ]
#}

#module "nginx_ingress" {
#  source            = "../../modules/nginx_ingress"
#}
