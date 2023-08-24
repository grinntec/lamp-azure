module "resource_group" {
  source = "git@github.com:grinntec-terraform-azure/terraform-azurerm-resource_group.git?ref=0.1.21"
  # insert required variables here
  prefix      = var.prefix
  location    = var.location
  environment = var.environment
}
