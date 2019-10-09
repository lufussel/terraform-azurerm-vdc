# terraform-azurerm-vdc

![](https://github.com/lufussel/terraform-azurerm-vdc/workflows/build/badge.svg)

## Create a Virtual Datacenter environment

This Terraform module deploys a number of resources based on [Microsoft Cloud Adoption Framework for Azure](https://aka.ms/caf) and [Azure Virtual Datacenter](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/reference/vdc) principals with basic inputs to provision the environment.

This module aims to be used as a base to develop an enterprise Virtual Datacenter environment.

The `terraform-azurerm-vdc` module deploys resources which act as a hub. A hub is the central network zone that controls and inspects ingress or egress traffic between different zones: internet, on-premises, and the spokes. 

An enterprise cloud environment may have multiple hubs across different regions and different environments.

This module is a complement to the `terraform-azurerm-vdc-spoke` module.

## Usage

```hcl
module "vdc" {
    source              = "github.com/lufussel/terraform-azurerm-vdc"
    resource_group_name = "vdc-rg"
    location            = "westeurope"
    remote_networks     = "10.1.0.0/16"

    tags                = {
                            application = "vdc-hub"
                            environment  = "development"
                          }
}

```

## Authors

Originally created by [Luke Fussell](http://github.com/lufussel)

## License

[MIT](LICENSE)
