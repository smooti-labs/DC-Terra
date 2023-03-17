# vSphere information
vcenter_server     = "vcenter1v.lordran.local"
vsphere_datacenter = "Datacenter"
vsphere_host       = "esxi1p.lordran.local"

# Domain Controller Configuration
template        = "Windows-Server-2022-Datacenter-030723"
network         = "Research"
vm_name         = "DomainCon"
vm_cpus         = 2
vm_cores        = 2
vm_memory       = 4112
vm_guest_id     = "windows2019srv_64Guest"
vm_disk_size    = 60
vm_scsi_type    = "lsilogic-sas"
vm_ipv4_address = "192.168.1.10"
vm_ipv4_netmask = 24
vm_ipv4_gateway = "192.168.1.1"
folder          = "Research"