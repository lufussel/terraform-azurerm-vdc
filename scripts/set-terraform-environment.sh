#!/bin/bash
echo "Set Terraform environmentvariables"
export ARM_CLIENT_ID=$(az keyvault secret show --vault-name "github-actions-keyvault" --name "tf-sp-id"  --query value -o tsv)
export ARM_CLIENT_SECRET=$(az keyvault secret show --vault-name "github-actions-keyvault" --name "tf-sp-key"  --query value -o tsv)
export ARM_SUBSCRIPTION_ID=$(az keyvault secret show --vault-name "github-actions-keyvault" --name "tf-subscription-id"  --query value -o tsv)
export ARM_TENANT_ID=$(az keyvault secret show --vault-name "github-actions-keyvault" --name "tf-tenant-id"  --query value -o tsv)