resource "azurerm_resource_group" "nsg" {
  name                = "${var.resource_group_name}"
  location            = "${var.location}"
  tags                = "${var.tags}"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_name}"
  location            = "${azurerm_resource_group.nsg.location}"
  resource_group_name = "${azurerm_resource_group.nsg.name}"

  tags = "${var.tags}"
}

resource "azurerm_network_security_rule" "nsg" {
  name                          = "${lookup(var.rules[count.index], "name", "default")}"
  priority                      = "${lookup(var.rules[count.index], "priority", 4000)}"

  direction                     = "${lookup(var.rules[count.index], "direction", "Inbound")}"
  access                        = "${lookup(var.rules[count.index], "access", "Allow")}"

  protocol                      = "${lookup(var.rules[count.index], "protocol", "Tcp")}"

  source_port_range             = "${lookup(var.rules[count.index], "source_port_range", "*")}"
  source_address_prefix         = "${lookup(var.rules[count.index], "source_address_prefix", "10.0.0.0/16")}"

  destination_port_range        = "${lookup(var.rules[count.index], "destination_port_range", "443")}"
  destination_address_prefix    = "${lookup(var.rules[count.index], "destination_address_prefix", "*")}"

  description                   = "${lookup(var.rules[count.index], "description", "default")}"

  resource_group_name           = "${azurerm_resource_group.nsg.name}"
  network_security_group_name   = "${azurerm_network_security_group.nsg.name}"

  count                         = "${length(var.rules)}"
}