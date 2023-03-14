vsphere_server     = "blah.local"
vsphere_datacenter = "blah-Datacenter"
vsphere_host       = "blah.local"

# Domain Controller Configuration
template_name = "Windows-Server-2022-Datacenter-030823"
network_name  = "VLAN-20"
vm_name      = "DomainCon"
vm_count     = 1
vm_cpus      = 2
vm_cores     = 2
vm_memory    = 4112
vm_guest_id  = "windows2019srv_64Guest"
vm_disk_size = 60
vm_scsi_type = "lsilogic-sas"
vm_ipv4_address = ""
vm_ipv4_netmask = 24
vm_ipv4_gateway = ""

folder = "Research"