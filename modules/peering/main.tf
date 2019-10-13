resource "azurerm_virtual_network_peering" "gateway" {
  name                          = "${var.gateway_vnet_name}-to-${var.hub_vnet_name}"
  resource_group_name           = "${var.gateway_resource_group_name}"
  virtual_network_name          = "${var.gateway_vnet_name}"
  remote_virtual_network_id     = "${var.hub_vnet_id}"
  allow_virtual_network_access  = true
  allow_gateway_transit         = true
  allow_forwarded_traffic       = true
}

resource "azurerm_virtual_network_peering" "hub" {
  name                          = "${var.hub_vnet_name}-to-${azurerm_virtual_network_peering.gateway.virtual_network_name}"
  resource_group_name           = "${var.hub_resource_group_name}"
  virtual_network_name          = "${var.hub_vnet_name}"
  remote_virtual_network_id     = "${var.gateway_vnet_id}"
  allow_virtual_network_access  = true
  use_remote_gateways           = true
  allow_forwarded_traffic       = true
}
