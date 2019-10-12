variable "gateway_name" {
  description = "The name of the virtual network gateway. Changing this forces a new resource to be created."
  default     = "hub-gateway"
}

variable "gateway_sku" {
  description = "The sku of the virtual network gateway."
  default     = "VpnGw1"
}

variable "vnet_name" {
  description = "The name of the virtual network in which to create the virtual network gateway. Changing this forces a new resource to be created."
  default     = "hub-gateway-network"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network gateway and virtual network."
  default     = "hub-gateway-rg"
}

variable "location" {
  description = "The location/region where the virtual network gateway is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "address_space" {
  description = "The address space that is used for the virtual network. You can supply more than one address space."
  default     = ["10.250.0.0/22"]
}

variable "gateway_subnet_prefix" {
  description = "The address prefixes to associate to the gateway subnet."
  default     = "10.250.0.0/24"
}

variable "gateway_public_ip_name" {
  description = "The name of the gateway public IP address. Changing this forces a new resource to be created."
  default     = "hub-gateway-pip"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}