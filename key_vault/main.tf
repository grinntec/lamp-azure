module "key_vault" {
  source = "git@github.com:grinntec-terraform-azure/terraform-azurerm-key_vault.git?ref=0.1.30"
  #these are the default variables for all resources
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  prefix                  = var.prefix
  environment             = var.environment
  #this section define resource specific settings
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  purge_protection_enabled        = var.purge_protection_enabled
  public_network_access_enabled   = var.public_network_access_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  appowner                        = var.appowner
}
