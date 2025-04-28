locals {
  cluster_nodes = {
    "talos-oss-cl8" = ["192.168.124.62", "192.168.124.117", "192.168.124.123"]
  }
  cluster_name = terraform.workspace
  nodes = "${local.cluster_nodes[local.cluster_name]}"
  cluster_endpoint  = format("https://%s:6443", element(local.nodes, 0))

}
