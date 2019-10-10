variable "hub_vnet_name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  default     = "hub-vnet"
}

variable "hub_resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  default     = "hub-vnet-rg"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "hub_address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  default     = ["10.0.0.0/16"]
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
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "firewall_subnet_prefix" {
  description = "The address prefixes to associate to the firewall subnet."
  default     = "10.0.0.0/24"
}

variable "firewall_name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  default     = "hub-fw"
}

variable "firewall_resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  default     = "hub-fw-rg"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}