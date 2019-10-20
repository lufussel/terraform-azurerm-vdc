output "nsg_id" {
  description = "The id of the network security group."
  value       = "${azurerm_network_security_group.nsg.id}"
}

output "nsg_name" {
  description = "The name of the network security group."
  value       = "${azurerm_network_security_group.nsg.name}"
}

output "resource_group_name" {
  description = "The name of the resource group in which the network security group was created."
  value       = "${azurerm_network_security_group.nsg.resource_group_name}"
}

output "nsg_location" {
  description = "The location of the network security group."
  value       = "${azurerm_network_security_group.nsg.location}"
}
