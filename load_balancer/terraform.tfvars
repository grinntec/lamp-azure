#these are the default variables for all resources
resource_group_name     = "rg-myapp-dev"
resource_group_location = "west europe"
prefix                  = "myapp"
environment             = "dev"
#this section define resource specific settings
is_public                = true
subnet_name              = "VmSubnet01"
vnet_name                = "vnet-grinntec-sandbox-westeurope"
vnet_resource_group_name = "rg-network-prod"
nic_names                = ["nic-myapp-web-dev-0", "nic-myapp-web-dev-1"]
workload                 = "web"

enable_https_rule             = false
enable_https_stickiness       = ""
enable_floating_ip_https      = true
idle_timeout_in_minutes_https = 10
disable_outbound_snat_https   = true

enable_http_rule             = true
enable_http_stickiness       = ""
enable_floating_ip_http      = false
idle_timeout_in_minutes_http = 10
disable_outbound_snat_http   = true
