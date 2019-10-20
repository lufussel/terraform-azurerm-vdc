resource "azurerm_resource_group" "route_table" {
  name                          = "${var.resource_group_name}"
  location                      = "${var.location}"
  tags                          = "${var.tags}"
}

resource "azurerm_route_table" "route_table" {
  name                          = "${var.route_table_name}"
  location                      = "${var.location}"
  resource_group_name           = "${azurerm_resource_group.route_table.name}"
  tags                          = "${var.tags}"
}

resource "azurerm_route" "route" {
  name                          = "default-route"
  resource_group_name           = "${azurerm_resource_group.route_table.name}"
  route_table_name              = "${azurerm_route_table.route_table.name}"
  address_prefix                = "0.0.0.0/0"
  next_hop_type                 = "VirtualAppliance"
  next_hop_in_ip_address        = "${var.default_gateway_ip_address}"
}
