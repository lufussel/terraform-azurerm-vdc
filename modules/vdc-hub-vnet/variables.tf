variable "vnet_name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  default     = "hub-vnet"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  default     = "hub-vnet-rg"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "westus"
}

variable "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  default     = "10.0.0.0/16"
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers. If no values specified, this defaults to Azure DNS."
  default     = []
}

variable "subnet_names" {
  description = "A list of  subnets inside the virtual network."
  default     = ["subnet1", "subnet2", "subnet3"]
}

variable "subnet_prefixes" {
  description = "A list of address prefixes to associate to the subnets."
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}