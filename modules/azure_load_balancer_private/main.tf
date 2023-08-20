resource "azurerm_network_interface" "example" {
  name                = "nic_lbi_${var.prefix}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.existing.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb" "example" {
  name                = "lbi_${var.prefix}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  frontend_ip_configuration {
    name                          = "private"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.existing.id
  }

  tags = local.tags

}

resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "backend-address-pool"
}

resource "azurerm_lb_nat_rule" "example" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "ssh"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "private"
}

resource "azurerm_network_interface_backend_address_pool_association" "existing_nic_association" {
  network_interface_id    = data.azurerm_network_interface.existing_nic.id
  ip_configuration_name   = data.azurerm_network_interface.existing_nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
}

resource "azurerm_lb_probe" "example_http_probe" {
  resource_group_name   = var.resource_group_name
  loadbalancer_id       = azurerm_lb.example.id
  name                  = "http-probe"
  port                  = 80
  protocol              = "Http"
  request_path          = "/"  # Adjust this path if needed
  interval_in_seconds   = 15
  number_of_probes      = 4
}

resource "azurerm_lb_rule" "example_http_rule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "private"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.example.id]
  probe_id                       = azurerm_lb_probe.example_http_probe.id
}
