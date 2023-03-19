## Configure Environment Variables

```powershell
$env:VSPHERE_USER = 'MyUserName'
$env:VSPHERE_PASSWORD = 'MyPassword'
$env:VSPHERE_SERVER = 'myvcenter.local'
$env:VSPHERE_ALLOW_UNVERIFIED_SSL='true' # OPTIONAL
```

```bash
export VSPHERE_USER='MyUserName'
export VSPHERE_PASSWORD='MyPassword'
export VSPHERE_SERVER='myvcenter.local'
export VSPHERE_ALLOW_UNVERIFIED_SSL='true' # OPTIONAL
```
## Required Variables
You are able to create a `terraform.tfvars` file containing the required variables.

```terraform
# vSphere information
vsphere_datacenter = "Datacenter"
vsphere_host       = "esxi1p.lordran.local"

# Domain Controller Configuration
template        = "Windows-Server-2022-Datacenter-031723"
network         = "Research"
name         = "DomainCon"
guest_id     = "windows2019srv_64Guest"
ipv4_address = "172.16.5.15"
ipv4_netmask = 24
ipv4_gateway = "172.16.5.1"

dns_domain_name = "rootkit.local"
folder          = "Research"
```