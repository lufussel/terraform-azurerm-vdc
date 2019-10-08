variable "firewall_name" {
  description = "The name of the firewall. Changing this forces a new resource to be created."
  default     = "hub-fw"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the firewall."
  default     = "hub-fw-rg"
}

variable "location" {
  description = "The location/region where the firewall is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "vnet_name" {
  description = "The name of the virtual network to deploy the firewall to."
  default     = "hub-vnet"
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group in which to create the firewall subnet."
  default     = "hub-vnet-rg"
}

variable "firewall_subnet_prefix" {
  description = "The address prefixes to associate to the firewall subnet."
  default     = "10.0.0.0/24"
}

variable "firewall_public_ip_name" {
  description = "The name of the firewall public IP address. Changing this forces a new resource to be created."
  default     = "hub-fw-pip"
}