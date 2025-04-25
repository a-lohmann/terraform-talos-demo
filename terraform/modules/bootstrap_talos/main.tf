resource "talos_machine_secrets" "this" {

}

resource "talos_machine_configuration_apply" "this" {

  for_each = toset(var.nodes)

  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.this.machine_configuration
  node                        = each.value
  config_patches = [
    file("${path.module}/talos_controlplane.yaml"),
  ]
}

resource "talos_machine_bootstrap" "this" {

  for_each = toset(var.nodes)

  depends_on = [
    talos_machine_configuration_apply.this
  ]
  node                 = each.value
  client_configuration = talos_machine_secrets.this.client_configuration
}

resource "talos_cluster_kubeconfig" "this" {

  for_each = toset(var.nodes)

  depends_on = [
    talos_machine_bootstrap.this
  ]
  client_configuration = talos_machine_secrets.this.client_configuration
  node                 = each.value
}

resource "local_sensitive_file" "kubeconfig" {

  for_each = toset(var.nodes)

  content  = talos_cluster_kubeconfig.this[each.value].kubeconfig_raw
  filename = "${path.module}/../../configs/kubeconfig-${var.cluster_name}-${each.value}.yaml"
  file_permission = "0640"
}


resource "local_sensitive_file" "single_kubeconfig" {

  content  = talos_cluster_kubeconfig.this[element(var.nodes, 0)].kubeconfig_raw
  filename = "${path.module}/../../configs/kubeconfig-${var.cluster_name}.yaml"
  file_permission = "0640"
}

resource "local_sensitive_file" "talosconfig" {

  content  = data.talos_client_configuration.this.talos_config
  filename = "${path.module}/../../configs/talosconfig-${var.cluster_name}.yaml"
  file_permission = "0640"
}
