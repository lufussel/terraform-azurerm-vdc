# terraform-azurerm-vdc

## Create a Virtual Datacenter environment

This Terraform module deploys a number of resources based on [Microsoft Cloud Adoption Framework for Azure](https://aka.ms/caf) and [Azure Virtual Datacenter](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/reference/vdc) principals with basic inputs to provision the environment.

This module aims to be used as a base to develop an enterprise Virtual Datacenter environment.

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
