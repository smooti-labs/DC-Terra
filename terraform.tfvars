vsphere_server     = "vcu.rtapu.local"
vsphere_datacenter = "VxRail-Datacenter"
vsphere_host       = "vsx-01.rtapu.local"

template_name = "Windows-Server-2022-Datacenter-030823"
network_name  = "NSX-VLAN-200"

vm_name      = "DomainCon"
vm_count     = 1
vm_cpus      = 2
vm_cores     = 2
vm_memory    = 4112
vm_guest_id  = "windows2019srv_64Guest"
vm_disk_size = 60
vm_scsi_type = "lsilogic-sas"

vm_ipv4_address = "172.16.5.15"
vm_ipv4_netmask = 24
vm_ipv4_gateway = "172.16.5.1"

folder = "Testing"