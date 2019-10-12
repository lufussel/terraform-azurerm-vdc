output "local_network_gateway_id" {
  description = "The id of the local network gateway."
  value       = "${azurerm_local_network_gateway.gateway_connection.id}"
}

output "local_network_gateway_name" {
  description = "The name of the local network gateway."
  value       = "${azurerm_local_network_gateway.gateway_connection.name}"
}

output "network_gateway_connection_id" {
  description = "The id of the network gateway connection."
  value       = "${azurerm_virtual_network_gateway_connection.gateway_connection.id}"
}

output "network_gateway_connection_name" {
  description = "The name of the network gateway connection."
  value       = "${azurerm_local_network_gateway.gateway_connection.name}"
}

output "resource_group_name" {
  description = "The name of the resource group in which the virtual network gateway was created."
  value       = "${azurerm_local_network_gateway.gateway_connection.resource_group_name}"
}
