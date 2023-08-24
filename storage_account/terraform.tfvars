#these are the default variables for all resources
resource_group_name = "rg-myapp-dev"
location            = "west europe"
prefix              = "myapp"
environment         = "dev"
#this section define resource specific settings
st_account_tier     = "Standard"
st_replication_type = "LRS"
st_account_kind     = "StorageV2"
