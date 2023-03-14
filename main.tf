provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_host" "host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template_dc" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template_windows_ws" {
  name          = "Windows-10-22H2-031323"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Deploy and provision domain controller
resource "vsphere_virtual_machine" "domain_controller" {
  count                   = var.vm_count
  name                    = "${var.vm_name}-${count.index}"
  num_cpus                = var.vm_cpus
  num_cores_per_socket    = var.vm_cores
  memory                  = var.vm_memory
  resource_pool_id        = data.vsphere_host.host.resource_pool_id
  guest_id                = var.vm_guest_id
  scsi_type               = var.vm_scsi_type
  firmware                = "efi"
  efi_secure_boot_enabled = true
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = var.vm_disk_size
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template_dc.id
    customize {
      timeout = 30
      windows_options {
        computer_name = "${var.vm_name}-${count.index}"
      }
      network_interface {
        ipv4_address = var.vm_ipv4_address
        ipv4_netmask = var.vm_ipv4_netmask
      }
      ipv4_gateway = var.vm_ipv4_gateway
    }
  }
  folder = var.folder

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${ var.vm_ipv4_address },' ansible/windows_dc/main.yaml"
  }
}

# Windows client
resource "vsphere_virtual_machine" "windows_ws" {
  depends_on = [vsphere_virtual_machine.domain_controller]

  count                   = 2
  name                    = "win-${count.index}"
  num_cpus                = 2
  num_cores_per_socket    = 2
  memory                  = 4112
  resource_pool_id        = data.vsphere_host.host.resource_pool_id
  guest_id                = "windows9_64Guest"
  scsi_type               = var.vm_scsi_type
  firmware                = "efi"
  efi_secure_boot_enabled = true
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = var.vm_disk_size
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template_windows_ws.id
    customize {
      timeout = 30
      windows_options {
        computer_name = "win-${count.index}"
		join_domain = "blah.local"
		domain_admin_user = "solaire"
		domain_admin_password = "1qaz2wsx!QAZ@WSX"
      }
      network_interface {

      }
      ipv4_gateway = var.vm_ipv4_gateway
    }
  }
  folder = var.folder
}