resource "azurerm_local_network_gateway" "gateway_connection" {
  name                = "${var.local_gateway_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  gateway_address     = "${var.local_gateway_public_ip}"
  address_space       = "${var.local_gateway_address_space}"
}

resource "azurerm_virtual_network_gateway_connection" "gateway_connection" {
  name                = "${var.gateway_connection_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  type                       = "IPsec"
  virtual_network_gateway_id = "${var.gateway_id}"
  local_network_gateway_id   = "${azurerm_local_network_gateway.gateway_connection.id}"

  shared_key = "${var.shared_key}"
}
