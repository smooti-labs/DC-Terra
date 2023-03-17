module "domain-controller" {
	source = "./modules/deploy-domain-controller"
	vsphere_datacenter = "Datacenter"
	vsphere_host       = "esxi1p.lordran.local"
	template        = "Windows-Server-2022-Datacenter-031723"
	network         = "Research"
	name         = "DomainCon"
	guest_id     = "windows2019srv_64Guest"
	ipv4_address = "172.16.5.15"
	ipv4_netmask = 24
	ipv4_gateway = "172.16.5.1"
	dns_domain_name = "rootkit.local"
	folder          = "Research"
	dsrm_password = "1qaz2wsx!QAZ@WSX"
}