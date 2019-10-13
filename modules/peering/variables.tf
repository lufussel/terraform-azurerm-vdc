variable "hub_vnet_name" {
  description = "The name of the hub virtual network for peering. Changing this forces a new resource to be created."
  default     = "hub-network"
}

variable "hub_vnet_id" {
  description = "The id of the hub virtual network for peering."
  default = "hub-network-id"
}

variable "gateway_vnet_name" {
  description = "The name of the gateway virtual network for peering. Changing this forces a new resource to be created."
  default     = "hub-gateway-network"
}

variable "gateway_vnet_id" {
  description = "The id of the gateway virtual network for peering."
  default = "hub-gateway-network-id"
}

variable "hub_resource_group_name" {
  description = "The name of the resource group in which to create the hub virtual network peering."
  default     = "hub-network-rg"
}

variable "gateway_resource_group_name" {
  description = "The name of the resource group in which to create the gateway virtual network peering."
  default     = "hub-gateway-rg"
}
