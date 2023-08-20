module "azure_resource_group" {
  source = "../../modules/azure_resource_group/"

  prefix      = var.prefix
  location    = var.location
  environment = var.environment
  created_by  = var.created_by
}