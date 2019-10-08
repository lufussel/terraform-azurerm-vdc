resource "azurerm_resource_group" "firewall" {
  name                      = "${var.resource_group_name}"
  location                  = "${var.location}"
}

resource "azurerm_subnet" "firewall" {
  name                      = "AzureFirewallSubnet"
  virtual_network_name      = "${var.vnet_name}"
  resource_group_name       = "${var.vnet_resource_group_name}"
  address_prefix            = "${var.firewall_subnet_prefix}"
}

resource "azurerm_public_ip" "firewall" {
  name                      = "${var.firewall_public_ip_name}"
  location                  = "${azurerm_resource_group.firewall.location}"
  resource_group_name       = "${azurerm_resource_group.firewall.name}"
  allocation_method         = "Static"
  sku                       = "Standard"
}

resource "azurerm_firewall" "firewall" {
  name                      = "${var.firewall_name}"
  location                  = "${azurerm_resource_group.firewall.location}"
  resource_group_name       = "${azurerm_resource_group.firewall.name}"

  ip_configuration {
    name                    = "configuration"
    subnet_id               = "${azurerm_subnet.firewall.id}"
    public_ip_address_id    = "${azurerm_public_ip.firewall.id}"
  }
}