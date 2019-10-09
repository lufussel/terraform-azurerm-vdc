resource "azurerm_subnet" "firewall" {
  name                      = "AzureFirewallSubnet"
  virtual_network_name      = "${var.vnet_name}"
  resource_group_name       = "${var.resource_group_name}"
  address_prefix            = "${var.firewall_subnet_prefix}"
}

resource "azurerm_public_ip" "firewall" {
  name                      = "${var.firewall_public_ip_name}"
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  allocation_method         = "Static"
  sku                       = "Standard"
  tags                      = "${var.tags}"
}

resource "azurerm_firewall" "firewall" {
  name                      = "${var.firewall_name}"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_subnet.firewall.resource_group_name}"
  tags                      = "${var.tags}"

  ip_configuration {
    name                    = "configuration"
    subnet_id               = "${azurerm_subnet.firewall.id}"
    public_ip_address_id    = "${azurerm_public_ip.firewall.id}"
  }
}