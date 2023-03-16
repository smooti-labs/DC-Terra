# vSphere information
vcenter_server     = ""
vsphere_datacenter = ""
vsphere_host       = ""

# Domain Controller Configuration
template        = "Windows-Server-2022-Datacenter-030823"
network         = "VLAN-20"
vm_name         = "DomainCon"
vm_cpus         = 2
vm_cores        = 2
vm_memory       = 4112
vm_guest_id     = "windows2019srv_64Guest"
vm_disk_size    = 60
vm_scsi_type    = "lsilogic-sas"
vm_ipv4_address = ""
vm_ipv4_netmask = 24
vm_ipv4_gateway = ""
folder          = "Research"