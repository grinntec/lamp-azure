output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
  description = "The name of the resource group"  
}

output "resource_group_location" {
  value = azurerm_resource_group.resource_group.location
  description = "The location of the resource group"
}