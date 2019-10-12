resource "azurerm_resource_group" "gateway" {
  name                = "${var.resource_group_name}"
  location            = "${var.location}"
  tags                = "${var.tags}"
}

resource "azurerm_virtual_network" "gateway" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  address_space       = "${var.address_space}"
  resource_group_name = "${azurerm_resource_group.gateway.name}"
  tags                = "${var.tags}"
}

resource "azurerm_subnet" "subnet" {
  name                      = "GatewaySubnet"
  virtual_network_name      = "${azurerm_virtual_network.gateway.name}"
  resource_group_name       = "${azurerm_resource_group.gateway.name}"
  address_prefix            = "${var.gateway_subnet_prefix}"
}

resource "azurerm_public_ip" "gateway" {
  name                      = "${var.gateway_public_ip_name}"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.gateway.name}"
  allocation_method         = "Dynamic"
  tags                      = "${var.tags}"
}

resource "azurerm_virtual_network_gateway" "gateway" {
  name                = "${var.gateway_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.gateway.name}"

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "${var.gateway_sku}"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = "${azurerm_public_ip.gateway.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.gateway.id}"
  }

  tags = "${var.tags}"
}
