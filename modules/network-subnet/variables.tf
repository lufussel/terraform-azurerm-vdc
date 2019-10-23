variable "subnet_name" {
  description = "The name of the subnet. Changing this forces a new subnet to be created."
  default     = "subnet1"
}

variable "subnet_prefix" {
  description = "The address prefix to associate to the subnet."
  default     = "10.0.2.0/24"
}

variable "vnet_name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  default     = "hub-network"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  default     = "hub-network-rg"
}

# variable "route_table_id" {
#   description = "The id of the route table to attach to the subnet."
#   default     = []
# }

# variable "nsg_id" {
#   description = "The id of the network security group to attach to the subnet."
#   default     = []
# }