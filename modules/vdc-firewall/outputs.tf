output "firewall_id" {
  description = "The id of the firewall."
  value       = "${azurerm_firewall.firewall.id}"
}

output "firewall_location" {
  description = "The location of the firewall."
  value       = "${azurerm_firewall.firewall.location}"
}

output "firewall_subnet" {
  description = "The id of subnet inside the virtual network."
  value       = "${azurerm_subnet.firewall.id}"
}

output "firewall_public_ip_id" {
  description = "The address space of the virtual network."
  value       = "${azurerm_public_ip.firewall.id}"
}