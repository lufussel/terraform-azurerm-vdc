resource "azurerm_subnet" "subnet" {
  name                      = "${var.subnet_name}"
  virtual_network_name      = "${var.vnet_name}"
  resource_group_name       = "${var.resource_group_name}"
  address_prefix            = "${var.subnet_prefix}"
  route_table_id            = "${var.route_table_id}"
  network_security_group_id = "${var.nsg_id}"
}

resource "azurerm_subnet_route_table_association" "route_table" {
  subnet_id      = "${azurerm_subnet.subnet.id}"
  route_table_id = "${var.route_table_id}"
}

resource "azurerm_subnet_network_security_group_association" "nsg" {
  subnet_id                 = "${azurerm_subnet.subnet.id}"
  network_security_group_id = "${var.nsg_id}"
}