locals {

  tags = {
    appname    = var.prefix
    env        = var.environment
    created_by = var.created_by
  }


  create_public_ip = var.create_public_ip == "yes" ? true : false
}
