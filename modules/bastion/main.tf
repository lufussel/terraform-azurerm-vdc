resource "azurerm_subnet" "bastion" {
  name                      = "AzureBastionSubnet"
  virtual_network_name      = "${var.vnet_name}"
  resource_group_name       = "${var.resource_group_name}"
  address_prefix            = "${var.bastion_subnet_prefix}"
}

resource "azurerm_public_ip" "bastion" {
  name                      = "${var.bastion_public_ip_name}"
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  allocation_method         = "Static"
  sku                       = "Standard"
  tags                      = "${var.tags}"
}

# Terraform does not have a resource definition for bastion at time of creation. This creates the pre-requisites for bastion only.
