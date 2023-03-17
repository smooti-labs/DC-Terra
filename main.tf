provider "vsphere" {
  vsphere_server       = var.vcenter_server
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
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Deploy and provision domain controller
resource "vsphere_virtual_machine" "domain_controller" {
  name                    = var.vm_name
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
        computer_name = var.vm_name
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
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${var.vm_ipv4_address},' ansible/windows_dc/main.yaml --extra-vars 'ansible_user=solaire ansible_password=1qaz2wsx!QAZ@WSX safe_mode_password=${var.dsrm_password} dns_domain_name=${var.dns_domain_name} domain_admin_password=1qaz2wsx!QAZ@WSX'"
  }
}
