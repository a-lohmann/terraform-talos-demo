terraform {
  required_providers {
    libvirt = {
      source = "nv6/libvirt"
      version = "0.8.4-beta"
    }
  }
}

provider "libvirt" {
  # Configuration options
    uri = "qemu:///system"
}
