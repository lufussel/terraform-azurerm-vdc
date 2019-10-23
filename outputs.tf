output "vnet_id_cluster" {
    value = "${module.hub_network.vnet_id}"
}

output "vnet_name_cluster" {
    value = "${module.hub_network.vnet_name}"
}

output "location" {
    value = "${module.hub_network.vnet_location}"
}

output "vnet_address_space_cluster" {
    value = "${module.hub_network.vnet_address_space}"
}

output "firewall_id" {
  description = "The id of the firewall."
  value       = "${module.firewall.firewall_id}"
}

output "firewall_public_ip_id" {
  description = "The address space of the virtual network."
  value       = "${module.firewall.firewall_public_ip_id}"
}