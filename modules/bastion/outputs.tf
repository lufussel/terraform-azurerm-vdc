output "bastion_subnet" {
  description = "The id of subnet inside the virtual network."
  value       = "${azurerm_subnet.firewall.id}"
}

output "bastion_public_ip_id" {
  description = "The id of the public IP address of bastion."
  value       = "${azurerm_public_ip.firewall.id}"
}