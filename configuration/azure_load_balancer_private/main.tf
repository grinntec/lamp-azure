module "azure_load_balancer_private" {
  source = "../../modules/azure_load_balancer_private/"

  resource_group_name            = var.resource_group_name
  prefix                         = var.prefix
  location                       = var.location
  environment                    = var.environment
  created_by                     = var.created_by
  vnet_resource_group_name       = var.vnet_resource_group_name
  vnet_name                      = var.vnet_name
  subnet_name                    = var.subnet_name
  existing_vm_nic_name           = var.existing_vm_nic_name
  existing_vm_nic_resource_group = var.existing_vm_nic_resource_group
}