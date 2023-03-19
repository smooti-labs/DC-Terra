# Local variables
locals {
  scsi_type   = "lsilogic-sas"
  firmware    = "efi"
  secure_boot = true
  timeout     = 30
}

# vSphere information
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

# Hardware information
variable "cpus" {
  description = "The number of CPUs on the virtual machine"
  type        = number
  default     = 2
}
variable "cores" {
  description = "The number of cores per CPU"
  type        = number
  default     = 2
}
variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 4112
}
variable "disk_size" {
  description = "Disk size of VM to create"
  type        = number
  default     = 60
}

# Domain controller information
<<<<<<< HEAD
variable "dc_name" {
=======
variable "name" {
>>>>>>> 5ec1e9dc2bae7dba9821daecf02abda005cbe523
  description = "Name of VM"
  nullable    = false
  type        = string
}
<<<<<<< HEAD
variable "dc_template" {
=======
variable "template" {
>>>>>>> 5ec1e9dc2bae7dba9821daecf02abda005cbe523
  description = "Template to use"
  nullable    = false
  type        = string
}
variable "network" {
  description = "Network to put VM"
  nullable    = false
  type        = string
}
<<<<<<< HEAD
variable "dc_guest_id" {
=======
variable "guest_id" {
>>>>>>> 5ec1e9dc2bae7dba9821daecf02abda005cbe523
  description = "Guest ID of the virtual machine"
  nullable    = false
  type        = string
}
variable "ipv4_address" {
  description = "Address to give to the virtual machine"
  nullable    = false
  type        = string
}
variable "ipv4_netmask" {
  description = "Subnet of network in CIDR format"
  nullable    = false
  type        = number
}
variable "ipv4_gateway" {
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
variable "domain_admin_user" {
  description = "Domain admin username for domain"
  nullable    = false
  type        = string
  sensitive   = true
}
variable "domain_admin_password" {
  description = "Domain admin password for domain"
  nullable    = false
  type        = string
  sensitive   = true
}

# Workstation information
variable "instances" {
  description = "Number of workstation instances"
  nullable    = false
  type        = number
}
variable "ws_name" {
  description = "Name of VM"
  nullable    = false
  type        = string
}
variable "ws_template" {
  description = "Template to use"
  nullable    = false
  type        = string
}
variable "ws_guest_id" {
  description = "Guest ID of the virtual machine"
  nullable    = false
  type        = string
}
