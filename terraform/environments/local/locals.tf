locals {
  cluster_nodes = {
    "talos-oss-cl9" = ["192.168.124.17", "192.168.124.116", "192.168.124.139"]
  }
  cluster_name = terraform.workspace
  nodes = "${local.cluster_nodes[local.cluster_name]}"
  cluster_endpoint  = format("https://%s:6443", element(local.nodes, 0))

}
