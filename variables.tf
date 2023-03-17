##############################
# Provider information
##############################

variable "vcenter_server" {
  description = "vCenter server to attach to"
  nullable    = false
  type        = string
}

variable "vsphere_datacenter" {
  description = "vSphere datacenter to use"
  nullable    = false
  type        = string
}

variable "vsphere_host" {
  description = "ESXI host in vCenter for compute resources"
  nullable    = false
  type        = string
}

##############################
# VM information
##############################

variable "template" {
  description = "Template to use"
  nullable    = false
  type        = string
}

variable "vm_disk_size" {
  description = "Disk size of VM to create"
  nullable    = false
  type        = number
}

variable "network" {
  description = "Network to put VM"
  nullable    = false
  type        = string
}

variable "vm_name" {
  description = "Name of VM"
  nullable    = false
  type        = string
}

variable "vm_cpus" {
  description = "The number of CPUs on the virtual machine"
  nullable    = false
  type        = string
}

variable "vm_cores" {
  description = "The number of cores per CPU"
  nullable    = false
  type        = string
}

variable "vm_memory" {
  description = "Memory in MB"
  nullable    = false
  type        = string
}

variable "vm_guest_id" {
  description = "Guest ID of the virtual machine"
  nullable    = false
  type        = string
}

variable "vm_scsi_type" {
  nullable = false
  type     = string
}

variable "vm_ipv4_address" {
  description = "Address to give to the virtual machine"
  nullable    = false
  type        = string
}

variable "vm_ipv4_netmask" {
  description = "Subnet of network in CIDR format"
  nullable    = false
  type        = number
}

variable "vm_ipv4_gateway" {
  description = "Gateway of network"
  nullable    = false
  type        = string
}

variable "folder" {
  description = "Where to place the virtual machine"
  nullable    = false
  type        = string
}

variable "dns_domain_name" {
  description = "Domain name to create"
  nullable    = false
  type        = string
}

variable "dsrm_password" {
  description = "DSRM password for domain"
  nullable    = false
  type        = string
  sensitive   = true
}