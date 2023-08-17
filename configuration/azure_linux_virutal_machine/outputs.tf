output "private_ip_address" {
  value       = module.azure_linux_virtual_machine.private_ip_address
  description = "The private IP address"
}

output "public_ip_address" {
  value       = module.azure_linux_virtual_machine.public_ip_address
  description = "The public IP address"
}