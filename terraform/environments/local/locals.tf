locals {
  cluster_nodes = {
    "talos-oss-cl7" = ["192.168.124.54", "192.168.124.193", "192.168.124.182"]
  }
  cluster_name = terraform.workspace
  nodes = "${local.cluster_nodes[local.cluster_name]}"
  cluster_endpoint  = format("https://%s:6443", element(local.nodes, 0))

}
