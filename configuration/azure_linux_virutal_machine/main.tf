module "azure_linux_virtual_machine" {
  source = "../../modules/azure_linux_virtual_machine/"

  resource_group_name      = var.resource_group_name
  prefix                   = var.prefix
  location                 = var.location
  environment              = var.environment
  created_by               = var.created_by
  vnet_resource_group_name = var.vnet_resource_group_name
  vnet_name                = var.vnet_name
  subnet_name              = var.subnet_name
}