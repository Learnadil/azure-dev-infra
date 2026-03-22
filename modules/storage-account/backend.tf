  terraform {
    backend "azurerm" {
    resource_group_name = "rg-terraform"
    storage_account_name = "jkstgaccount"
    container_name = "jktf-dev-backend"
    key = "dev-terraform.tfstate"
  }
  }