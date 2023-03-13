variable "vsphere_user" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "vsphere_password" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "vsphere_server" {
  nullable = false
  type     = string
}

variable "vsphere_datacenter" {
  nullable = false
  type     = string
}

variable "vsphere_host" {
  nullable = false
  type     = string
}

variable "template_name" {
  nullable = false
  type     = string
}

variable "vm_disk_size" {
  nullable = false
  type     = number
}

variable "network_name" {
  nullable = false
  type     = string
}

variable "vm_name" {
  nullable = false
  type     = string
}

variable "vm_count" {
  description = "The number of virtual machines"
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
  nullable = false
  type     = string
}

variable "vm_ipv4_netmask" {
  nullable = false
  type     = number
}

variable "vm_ipv4_gateway" {
  nullable = false
  type     = string
}

variable "folder" {
  nullable = false
  type     = string
}