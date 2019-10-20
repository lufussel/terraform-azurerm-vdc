variable "resource_group_name" {
  description = "The name of the resource group in which to create bastion."
  default     = "hub-bastion-rg"
}

variable "location" {
  description = "The location/region where bastion is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "vnet_name" {
  description = "The name of the virtual network to deploy bastion to."
  default     = "hub-vnet"
}

variable "bastion_subnet_prefix" {
  description = "The address prefixes to associate to bastion subnet."
  default     = "10.0.1.0/24"
}

variable "bastion_public_ip_name" {
  description = "The name of the bastion public IP address. Changing this forces a new resource to be created."
  default     = "hub-bastion-pip"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}