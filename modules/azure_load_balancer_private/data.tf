data "azurerm_subnet" "existing" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group_name
}

data "azurerm_network_interface" "existing_nic" {
  name                = var.existing_vm_nic_name
  resource_group_name = var.existing_vm_nic_resource_group
}

