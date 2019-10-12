output "gateway_id" {
  description = "The id of the virtual network gateway."
  value       = "${azurerm_virtual_network_gateway.gateway.id}"
}

output "gateway_name" {
  description = "The name of the virtual network gateway."
  value       = "${azurerm_virtual_network_gateway.gateway.name}"
}

output "resource_group_name" {
  description = "The name of the resource group in which the virtual network gateway was created."
  value       = "${azurerm_virtual_network_gateway.gateway.resource_group_name}"
}

output "gateway_location" {
  description = "The location of the virtual network gateway."
  value       = "${azurerm_virtual_network_gateway.gateway.location}"
}

output "vnet_id" {
  description = "The id of the virtual network."
  value       = "${azurerm_virtual_network.gateway.id}"
}

output "vnet_name" {
  description = "The name of the virtual network."
  value       = "${azurerm_virtual_network.gateway.name}"
}

output "gateway_subnet" {
  description = "The id of subnet inside the virtual network."
  value       = "${azurerm_subnet.gateway.id}"
}

output "gateway_public_ip_id" {
  description = "The id of the public IP address of the gateway."
  value       = "${azurerm_public_ip.gateway.id}"
}