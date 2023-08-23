output "linux_virtual_machine_name" {
  description = "The name of the VM"
  value       = module.linux_virtual_machine.linux_virtual_machine_name
}

output "linux_virtual_machine_private_ips" {
  description = "Private IP addresses of the linux virtual machines"
  value       = module.linux_virtual_machine.network_interface_private_ips
}

output "linux_virtual_machine_public_ips" {
  description = "Public IP addresses of the linux virtual machines"
  value       = module.linux_virtual_machine.public_ips
}
