output "vnet_id_cluster" {
    value = "${module.vdc_hub_vnet.vnet_id}"
}

output "vnet_name_cluster" {
    value = "${module.vdc_hub_vnet.vnet_name}"
}

output "location" {
    value = "${module.vdc_hub_vnet.vnet_location}"
}

output "vnet_address_space_cluster" {
    value = "${module.vdc_hub_vnet.vnet_address_space}"
}

output "vnet_subnets_cluster" {
    value = "${module.vdc_hub_vnet.vnet_subnets}"
}
