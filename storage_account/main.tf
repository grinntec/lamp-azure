module "storage_account" {
  source = "git@github.com:grinntec-terraform-azure/terraform-azurerm-storage_account.git?ref=0.1.16"
  #these are the default variables for all resources
  resource_group_name = var.resource_group_name
  location            = var.location
  prefix              = var.prefix
  environment         = var.environment
  #this section define resource specific settings
  st_account_tier     = var.st_account_tier
  st_replication_type = var.st_replication_type
  st_account_kind     = var.st_account_kind
}