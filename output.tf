<<<<<<< HEAD
output "dc_computer_name" {
  value = vsphere_virtual_machine.domain_controller.clone[0].customize[0].windows_options[0].computer_name
}

output "dc_ipv4_address" {
  value = vsphere_virtual_machine.domain_controller.clone[0].customize[0].network_interface[0].ipv4_address
}

output "ws_computer_name" {
  value = ["${vsphere_virtual_machine.windows_ws[*].clone[0].customize[0].windows_options[0].computer_name}"]
}

output "ws_ipv4_address" {
  value = ["${vsphere_virtual_machine.windows_ws[*].default_ip_address}"]
=======
output "computer_name" {
  value = vsphere_virtual_machine.domain_controller.clone[0].customize[0].windows_options[0].computer_name
}

output "ipv4_address" {
  value = vsphere_virtual_machine.domain_controller.clone[0].customize[0].network_interface[0].ipv4_address
>>>>>>> 5ec1e9dc2bae7dba9821daecf02abda005cbe523
}