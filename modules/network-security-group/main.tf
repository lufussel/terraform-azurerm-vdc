resource "azurerm_resource_group" "nsg" {
  name                = "${var.resource_group_name}"
  location            = "${var.location}"
  tags                = "${var.tags}"
}

# Example rule inside nsg definition

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_name}"
  location            = "${azurerm_resource_group.nsg.location}"
  resource_group_name = "${azurerm_resource_group.nsg.name}"

  security_rule {
    name                       = "HTTPS"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefixes    = "${var.source_address_prefix}"
    destination_address_prefix = "*"
  }

  tags = "${var.tags}"
}

# Example rule outside nsg definition

resource "azurerm_network_security_rule" "nsg" {
  name                        = "HTTP"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefixes     = "${var.source_address_prefix}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.nsg.name}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}