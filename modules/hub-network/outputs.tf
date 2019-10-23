output "vnet_id" {
  description = "The id of the virtual network."
  value       = "${azurerm_virtual_network.vnet.id}"
}

output "vnet_name" {
  description = "The name of the virtual network."
  value       = "${azurerm_virtual_network.vnet.name}"
}

output "resource_group_name" {
  description = "The name of the resource group in which the virtual network was created."
  value       = "${azurerm_virtual_network.vnet.resource_group_name}"
}

output "vnet_location" {
  description = "The location of the virtual network."
  value       = "${azurerm_virtual_network.vnet.location}"
}

output "vnet_address_space" {
  description = "The address space of the virtual network."
  value       = "${azurerm_virtual_network.vnet.address_space}"
}