#these are the default variables for all resources
resource_group_name     = "rg-myapp-dev"
resource_group_location = "west europe"
prefix                  = "myapp"
environment             = "dev"
#this section define resource specific settings
vnet_resource_group_name      = "rg-network-prod"
vnet_name                     = "vnet-grinntec-sandbox-westeurope"
subnet_name                   = "VmSubnet01"
create_public_ip              = "no"
create_proximity_group        = "yes"
node_count                    = 2
workload                      = "web"
vm_sku                        = "Standard_B1s"
key_vault_name                = "kv-7dc2-myapp-dev"
key_vault_resource_group_name = "rg-myapp-dev"
run_custom_script             = true
custom_script_path            = "install_apache.tpl"
