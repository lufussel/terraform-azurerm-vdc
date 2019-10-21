terraform {
  required_version          = ">= 0.12"
}

module "hub_network" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "github.com/lufussel/terraform-azurerm-vdc/modules/hub-network?ref=v0.0.1"
  source                    = "./modules/hub-network"

  vnet_name                 = "${var.hub_vnet_name}"

  resource_group_name       = "${var.hub_resource_group_name}"
  location                  = "${var.location}"

  address_space             = "${var.hub_address_space}"
  dns_servers               = "${var.hub_dns_servers}"
  subnet_names              = "${var.hub_subnet_names}"
  subnet_prefixes           = "${var.hub_subnet_prefixes}"
  route_table_id            = "${module.default_route_table.route_table_id}"

  tags                      = "${var.tags}"
}

module "firewall" {
  source                    = "./modules/firewall"

  firewall_name             = "${var.firewall_name}"

  resource_group_name       = "${module.hub_network.resource_group_name}"
  location                  = "${var.location}"

  vnet_name                 = "${module.hub_network.vnet_name}"
  firewall_subnet_prefix    = "${var.firewall_subnet_prefix}"
  firewall_public_ip_name   = "${var.firewall_name}-pip"

  tags                      = "${var.tags}"
}

module "bastion" {
  source                    = "./modules/bastion"

  resource_group_name       = "${module.hub_network.resource_group_name}"
  location                  = "${var.location}"

  vnet_name                 = "${module.hub_network.vnet_name}"
  bastion_subnet_prefix     = "${var.bastion_subnet_prefix}"
  bastion_public_ip_name    = "${var.bastion_name}-pip"

  tags                      = "${var.tags}"
}

module "gateway" {
  source                    = "./modules/gateway"

  gateway_name              = "${var.gateway_name}"

  resource_group_name       = "${var.gateway_resource_group_name}"
  location                  = "${var.location}"

  vnet_name                 = "${var.gateway_vnet_name}"
  address_space             = "${var.gateway_address_space}"
  gateway_subnet_prefix     = "${var.gateway_subnet_prefix}"
  gateway_public_ip_name    = "${var.gateway_name}-pip"

  tags                      = "${var.tags}"
}

module "gateway_connection" {
  source                        = "./modules/gateway-connection"

  gateway_connection_name       = "${var.local_gateway_name}-connection"
  shared_key                    = "${var.gateway_connection_shared_key}"

  local_gateway_name            = "${var.local_gateway_name}"
  local_gateway_public_ip       = "${var.local_gateway_public_ip}"
  local_gateway_address_space   = "${var.local_gateway_address_space}"

  resource_group_name           = "${module.gateway.resource_group_name}"
  location                      = "${var.location}"

  gateway_id                    = "${module.gateway.gateway_id}"

  tags                          = "${var.tags}"
}

module "peering" {
  source                        = "./modules/peering"

  hub_vnet_name                 = "${module.hub_network.vnet_name}"
  hub_vnet_id                   = "${module.hub_network.vnet_id}"
  hub_resource_group_name       = "${module.hub_network.resource_group_name}"
  gateway_vnet_name             = "${module.gateway.vnet_name}"
  gateway_vnet_id               = "${module.gateway.vnet_id}"
  gateway_resource_group_name   = "${module.gateway.resource_group_name}"
}

# TEMP: Example using built in module

module "network_security_group" {
  source                        = "./modules/network-security-group"

  nsg_name                      = "${var.nsg_prefix}-example1-nsg"

  resource_group_name           = "${var.nsg_resource_group_name}"
  location                      = "${var.location}"

  source_address_prefix         = ["10.0.0.0/16"]

  tags                          = "${var.tags}"
}

# TEMP: Example using terraform-azurerm-network-security-group module published on GitHub 

module "github_network_security_group" {
  source                        = "github.com/Azure/terraform-azurerm-network-security-group"

  security_group_name           = "${var.nsg_prefix}-example2-nsg"

  resource_group_name           = "${var.nsg_resource_group_name}"
  location                      = "${var.location}"

  source_address_prefix         = ["10.0.0.0/16"]
  predefined_rules              = [
    {
      name = "HTTPS"
    }
  ]

  tags                          = "${var.tags}"
}

module "nsg_external_customrules_module" {
  source                        = "Azure/network-security-group/azurerm"

  security_group_name           = "cs-allow-custom-nsg"

  resource_group_name           = "cs-hub-nsg-rg"
  location                      = "${var.location}"

  custom_rules                  = [
    {
      name                        = "allow-ad-rpc"
      priority                    = "1000"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "*"
      destination_port_ranges     = "135"
      destination_address_prefix  = "*"
      description                 = "Allow RPC for Active Directory"
    }
  ]

  tags                          = "${var.tags}"
}

# Default route table

module "default_route_table" {
  source                        = "./modules/route-table"

  route_table_name              = "${var.hub_vnet_name}-default-route-table"

  resource_group_name           = "${var.route_table_resource_group_name}"
  location                      = "${var.location}"

  default_gateway_ip_address    = "${var.route_table_default_gateway_ip_address}"

  tags                          = "${var.tags}"
}


# Example with subnet specific modules using network-subnet module

module "domain_subnet" {
  source                    = "./modules/network-subnet"

  vnet_name                 = "${module.hub_network.vnet_name}"

  resource_group_name       = "${module.hub_network.resource_group_name}"

  subnet_name               = "${var.domain_subnet_name}"
  subnet_prefix             = "${var.domain_subnet_prefix}"
  route_table_id            = "${module.default_route_table.route_table_id}"
  nsg_id                    = "${module.domain_subnet_network_security_group.nsg_id}"
}

# Subnet specific NSG

module "domain_subnet_network_security_group" {
  source                          = "./modules/network-security-group-rules"

  nsg_name                        = "${var.domain_nsg_name}"

  resource_group_name             = "${var.nsg_resource_group_name}"
  location                        = "${var.location}"

  rules                           = "${var.domain_nsg_rules}"

  tags                            = "${var.tags}"
}