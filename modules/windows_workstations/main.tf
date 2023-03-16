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
        computer_name         = "win-${count.index}"
        join_domain           = "blah.local"
        domain_admin_user     = "solaire"
        domain_admin_password = "1qaz2wsx!QAZ@WSX"
      }
      network_interface {
        dns_server_list = [var.vm_ipv4_address]
      }
      ipv4_gateway = var.vm_ipv4_gateway
    }
  }
  folder = var.folder
}