#these are the default variables for all resources
resource_group_name     = "rg-myapp-dev"
resource_group_location = "west europe"
prefix                  = "myapp"
environment             = "dev"
#this section define resource specific settings
sku_name                        = "standard"
enabled_for_deployment          = true
enabled_for_disk_encryption     = true
enabled_for_template_deployment = true
enable_rbac_authorization       = false
purge_protection_enabled        = true
public_network_access_enabled   = true
soft_delete_retention_days      = 90
appowner                        = "grinntec_gmail.com#EXT#@grinntecgmail.onmicrosoft.com"
