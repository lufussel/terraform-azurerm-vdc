terraform {
  required_version          = ">= 0.12"
}

module "vdc_hub_vnet" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "github.com/lufussel/terraform-azurerm-vdc/modules/vdc-hub-vnet?ref=v0.0.1"
  source                    = "./modules/vdc-hub-vnet"

  vnet_name                 = "${var.hub_vnet_name}"

  resource_group_name       = "${var.hub_resource_group_name}"
  location                  = "${var.location}"

  address_space             = "${var.hub_address_space}"
  dns_servers               = "${var.hub_dns_servers}"
  subnet_names              = "${var.hub_subnet_names}"
  subnet_prefixes           = "${var.hub_subnet_prefixes}"

  tags                      = "${var.tags}"
}

module "vdc_hub_firewall" {
  source                    = "./modules/vdc-firewall"

  firewall_name             = "${var.firewall_name}"

  resource_group_name       = "${var.firewall_resource_group_name}"
  location                  = "${var.location}"

  vnet_name                 = "${module.vdc_hub_vnet.vnet_name}"
  vnet_resource_group_name  = "${module.vdc_hub_vnet.resource_group_name}"

  firewall_subnet_prefix    = "${var.firewall_subnet_prefix}"
  firewall_public_ip_name   = "${var.firewall_name}-pip"

  tags                      = "${var.tags}"
}
