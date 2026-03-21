terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
    }
  }
}

  backend "azurerm" {
    resource_group_name = "rg-terraform"
    storage_account_name = "jkstgaccount"
    container_name = "jktf-dev-backend"
    key = "dev-terraform.tfstate"
  }

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "rg-terraform"
  location = "eastus"   
}

resource "azurerm_storage_account" "jkstg" {
  name                     = "jkstgaccount"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
