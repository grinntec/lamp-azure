resource "azurerm_resource_group" "resource_group" {
  name     = "rg-${var.prefix}-${var.environment}"
  location = var.location
  tags     = local.tags
}

locals {
  tags = {
    appname    = var.prefix
    env        = var.environment
    created_by = var.created_by
  }
}