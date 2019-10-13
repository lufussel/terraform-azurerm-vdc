output "hub_peering_id" {
  description = "The id of the hub virtual network peering."
  value       = "${azurerm_virtual_network_peering.hub.id}"
}

output "gateway_peering_id" {
  description = "The id of the gateway virtual network peering."
  value       = "${azurerm_virtual_network_peering.gateway.id}"
}
