variable "hub_vnet_name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  default     = "hub-network"
}

variable "hub_resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  default     = "hub-network-rg"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "hub_address_space" {
  description = "The address space that is used for the virtual network. You can supply more than one address space."
  default     = ["10.100.0.0/16"]
}

variable "hub_dns_servers" {
  description = "List of IP addresses of DNS servers. If no values specified, this defaults to Azure DNS."
  default     = []
}

variable "hub_subnet_names" {
  description = "A list of  subnets inside the virtual network."
  default     = ["subnet1", "subnet2", "subnet3"]
}

variable "hub_subnet_prefixes" {
  description = "A list of address prefixes to associate to the subnets."
  default     = ["10.100.2.0/24", "10.100.3.0/24", "10.100.4.0/24"]
}

variable "firewall_subnet_prefix" {
  description = "The address prefix to associate to the firewall subnet."
  default     = "10.100.0.0/24"
}

variable "bastion_subnet_prefix" {
  description = "The address prefix to associate to the bastion subnet."
  default     = "10.100.1.0/24"
}

variable "firewall_name" {
  description = "The name of the firewall. Changing this forces a new resource to be created."
  default     = "hub-firewall"
}

variable "bastion_name" {
  description = "The name of the bastion. Changing this forces a new resource to be created."
  default     = "hub-bastion"
}

variable "gateway_name" {
  description = "The name of the virtual network gateway. Changing this forces a new resource to be created."
  default     = "hub-gateway"
}

variable "gateway_resource_group_name" {
  description = "The name of the resource group in which to create the virtual network gateway."
  default     = "hub-gateway-rg"
}

variable "gateway_vnet_name" {
  description = "The name of the virtual network in which to create the virtual network gateway. Changing this forces a new resource to be created."
  default     = "hub-gateway-network"
}

variable "gateway_address_space" {
  description = "The address space that is used for the virtual network gateway. You can supply more than one address space."
  default     = ["10.250.0.0/22"]
}

variable "gateway_subnet_prefix" {
  description = "The address prefix to associate to the gateway subnet."
  default     = "10.250.0.0/24"
}

variable "local_gateway_name" {
  description = "The name of the local gateway. Changing this forces a new resource to be created."
  default     = "on-premises-gateway"
}

variable "local_gateway_public_ip" {
  description = "The IP address of the local gateway."
  default     = "123.123.123.123"
}

variable "local_gateway_address_space" {
  description = "The address space of the local gateway."
  default     = ["10.0.0.0/16"]
}

variable "gateway_connection_shared_key" {
  description = "The shared key used for the gateway connection. Do not store this key in source control."
  default     = ""
}

variable "nsg_prefix" {
  description = "The prefix of the network security group names. Changing this forces a new resource to be created."
  default     = "hub"
}

variable "nsg_resource_group_name" {
  description = "The name of the resource group in which to create the network security groups."
  default     = "hub-nsg-rg"
}

variable "route_table_resource_group_name" {
  description = "The name of the resource group in which to create route tables."
  default     = "hub-route-table-rg"
}

variable "route_table_default_gateway_ip_address" {
  description = "The IP address used for the default gateway, such as a network virtual appliance or firewall."
  default     = "10.100.0.4"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}
