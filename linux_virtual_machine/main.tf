module "linux_virtual_machine" {
  source = "git@github.com:grinntec-terraform-azure/terraform-azurerm-linux_virtual_machine.git?ref=0.1.33"
  #these are the default variables for all resources
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  prefix                  = var.prefix
  environment             = var.environment
  #this section define resource specific settings
  vnet_resource_group_name      = var.vnet_resource_group_name
  vnet_name                     = var.vnet_name
  subnet_name                   = var.subnet_name
  create_public_ip              = var.create_public_ip
  create_proximity_group        = var.create_proximity_group
  node_count                    = var.node_count
  workload                      = var.workload
  vm_sku                        = var.vm_sku
  key_vault_name                = var.key_vault_name
  key_vault_resource_group_name = var.key_vault_resource_group_name
  run_custom_script             = var.run_custom_script
  custom_script_path            = var.custom_script_path
}