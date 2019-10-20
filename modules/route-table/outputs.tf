output "route_table_id" {
  description = "The id of the route table."
  value       = "${azurerm_route_table.route_table.id}"
}

output "route_table_name" {
  description = "The name of the route table."
  value       = "${azurerm_route_table.route_table.name}"
}

output "resource_group_name" {
  description = "The name of the resource group in which the route table was created."
  value       = "${azurerm_route_table.route_table.resource_group_name}"
}

output "route_table_location" {
  description = "The location of the route table."
  value       = "${azurerm_route_table.route_table.location}"
}
