variable "route_table_name" {
  description = "The name of the route table. Changing this forces a new resource to be created."
  default     = "hub-default-route-table"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the route table."
  default     = "hub-route-table-rg"
}

variable "location" {
  description = "The location/region where the route table is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "default_gateway_ip_address" {
  description = "The IP address used for the default gateway, such as a network virtual appliance or firewall."
  default     = "10.0.0.4"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
  }
}