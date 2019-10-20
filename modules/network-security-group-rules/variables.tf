variable "nsg_name" {
  description = "The name of the network security group. Changing this forces a new resource to be created."
  default     = "allow-https-nsg"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group."
  default     = "hub-nsg-rg"
}

variable "rules" {
  description = "The rule set for the network security group."
}

variable "location" {
  description = "The location/region where the network security group is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}
