locals {
  tags = {
    appname    = var.prefix
    env        = var.environment
    created_by = var.created_by
  }
}