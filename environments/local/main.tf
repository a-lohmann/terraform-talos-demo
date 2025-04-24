#resource "libvirt_volume" "install_iso" {
#  name           = "install-iso"
#  file           = "/home/$USER/tmp/metal-amd64.iso"
#}

resource "libvirt_volume" "os_disk" {
  name           = "os-disk"
  size           = 20
  pool           = "default"
  format         = "raw"
}

resource "libvirt_domain" "libvirt_domain_node" {
  name   = "test123"
  memory = "6144"
  vcpu   = 3

  #kernel = libvirt_volume.kernel.id


  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "0"
  }

  graphics {
    type        = "vnc"
  }

  disk {
    file = "${var.iso_dir}/metal-amd64.iso"
  }

  disk {
    volume_id = libvirt_volume.os_disk.id
    scsi      = "true"
  }


}


#    --os-variant linux2022 \
#    --cdrom /home/$USER/tmp/metal-amd64.iso \
#    --disk "format=qcow2,sparse=true,size=20,device=disk,bus=virtio" \
#    --disk "format=qcow2,sparse=true,size=20,device=disk,bus=virtio" \

