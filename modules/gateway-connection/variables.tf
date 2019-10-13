variable "gateway_connection_name" {
  description = "The name of the gateway connection. Changing this forces a new resource to be created."
  default     = "on-premises-gateway-connection"
}

variable "shared_key" {
  description = "The shared key used for the gateway connection. Do not store this key in source control."
  default     = ""
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
  default     = ["10.100.0.0/16"]
}

variable "location" {
  description = "The location/region where the gateway connection is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the firewall."
  default     = "hub-gateway-rg"
}

variable "gateway_id" {
  description = "The id of the virtual network gateway. Changing this forces a new resource to be created."
  default     = "on-premises-gateway-connection"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}
