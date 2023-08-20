# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group_name
  }
  byte_length = 8
}

# Create public IP address
resource "azurerm_public_ip" "pip" {
  count               = local.create_public_ip ? 1 : 0
  name                = "pip_vm${random_id.random_id.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = local.tags
}

# Create a network interface card and assign an IP from the subnet and attach the PIP
resource "azurerm_network_interface" "nic" {
  name                = "nic_vm${random_id.random_id.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = local.create_public_ip ? azurerm_public_ip.pip[0].id : null
  }
  tags = local.tags
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "storage_account" {
  name                     = "diagvm${random_id.random_id.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm${random_id.random_id.hex}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_B1s"
  network_interface_ids = [azurerm_network_interface.nic.id]



  os_disk {
    name                 = "os_disk_vm${random_id.random_id.hex}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "vm${random_id.random_id.hex}"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage_account.primary_blob_endpoint
  }

  # Cloud Init
  custom_data = filebase64("cloudinit.tpl")

  tags = local.tags
}