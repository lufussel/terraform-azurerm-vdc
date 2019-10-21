output "vnet_subnet_id" {
  description = "The ids of subnets inside the virtual network."
  value       = "${azurerm_subnet.subnet.id}"
}