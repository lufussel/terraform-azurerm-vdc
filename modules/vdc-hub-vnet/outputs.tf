output "vnet_id" {
  description = "The id of the virtual network."
  value       = "${azurerm_virtual_network.vnet.id}"
}

output "vnet_name" {
  description = "The name of the virtual network."
  value       = "${azurerm_virtual_network.vnet.name}"
}

output "vnet_location" {
  description = "The location of the virtual network."
  value       = "${azurerm_virtual_network.vnet.location}"
}

output "vnet_address_space" {
  description = "The address space of the virtual network."
  value       = "${azurerm_virtual_network.vnet.address_space}"
}

output "vnet_subnets" {
  description = "The ids of subnets inside the virtual network."
  value       = "${azurerm_subnet.subnet.*.id}"
}