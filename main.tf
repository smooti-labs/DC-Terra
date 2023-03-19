data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_host" "host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

<<<<<<< HEAD
data "vsphere_virtual_machine" "dc_template" {
  name          = var.dc_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "ws_template" {
  name          = var.ws_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

=======
data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

>>>>>>> 5ec1e9dc2bae7dba9821daecf02abda005cbe523
# Deploy and provision domain controller
resource "vsphere_virtual_machine" "domain_controller" {
  name                    = var.dc_name
  num_cpus                = var.cpus
  num_cores_per_socket    = var.cores
  memory                  = var.memory
  resource_pool_id        = data.vsphere_host.host.resource_pool_id
  guest_id                = var.dc_guest_id
  scsi_type               = local.scsi_type
  firmware                = local.firmware
  efi_secure_boot_enabled = local.secure_boot
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = var.disk_size
  }
  clone {
<<<<<<< HEAD
    template_uuid = data.vsphere_virtual_machine.dc_template.id
=======
    template_uuid = data.vsphere_virtual_machine.template.id
>>>>>>> 5ec1e9dc2bae7dba9821daecf02abda005cbe523
    customize {
      timeout = local.timeout
      windows_options {
        computer_name = var.dc_name
      }
      network_interface {
        ipv4_address = var.ipv4_address
        ipv4_netmask = var.ipv4_netmask
      }
      ipv4_gateway = var.ipv4_gateway
    }
  }
  folder = var.folder

  provisioner "local-exec" {
    command = "ansible-playbook -i '${var.ipv4_address},' ansible/windows_dc/main.yaml --extra-vars 'ansible_user=solaire ansible_password=1qaz2wsx!QAZ@WSX safe_mode_password=${var.dsrm_password} dns_domain_name=${var.dns_domain_name} domain_admin_password=1qaz2wsx!QAZ@WSX'"
  }
}

# Deploy and provision windows workstation
resource "vsphere_virtual_machine" "windows_ws" {
  depends_on              = [vsphere_virtual_machine.domain_controller]
  count                   = var.instances
  name                    = "${var.ws_name}-${count.index}"
  num_cpus                = var.cpus
  num_cores_per_socket    = var.cores
  memory                  = var.memory
  resource_pool_id        = data.vsphere_host.host.resource_pool_id
  guest_id                = var.ws_guest_id
  scsi_type               = local.scsi_type
  firmware                = local.firmware
  efi_secure_boot_enabled = local.secure_boot
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = var.disk_size
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.ws_template.id
    customize {
      timeout = local.timeout
      windows_options {
        computer_name = "${var.ws_name}-${count.index}"
		join_domain = var.dns_domain_name
		domain_admin_user = var.domain_admin_user
		domain_admin_password = var.domain_admin_password
      }
      network_interface {
        dns_server_list = [var.ipv4_address]
      }
    }
  }
  folder = var.folder

}
