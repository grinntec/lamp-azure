module "load_balancer" {
  source = "git@github.com:grinntec-terraform-azure/terraform-azurerm-load_balancer_public.git?ref=0.1.47"
  #these are the default variables for all resources
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  prefix                  = var.prefix
  environment             = var.environment
  #this section define resource specific settings  
  is_public                     = var.is_public
  subnet_name                   = var.subnet_name
  vnet_name                     = var.vnet_name
  vnet_resource_group_name      = var.vnet_resource_group_name
  nic_names                     = var.nic_names
  workload                      = var.workload
  
  enable_https_rule             = var.enable_https_rule
  enable_https_stickiness       = var.enable_https_stickiness
  enable_floating_ip_https      = var.enable_floating_ip_https
  idle_timeout_in_minutes_https = var.idle_timeout_in_minutes_https
  disable_outbound_snat_https   = var.disable_outbound_snat_https
  
  enable_http_rule              = var.enable_http_rule
  enable_http_stickiness        = var.enable_http_stickiness
  enable_floating_ip_http       = var.enable_floating_ip_http
  idle_timeout_in_minutes_http  = var.idle_timeout_in_minutes_http
  disable_outbound_snat_http    = var.disable_outbound_snat_http
}


