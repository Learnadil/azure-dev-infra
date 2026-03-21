terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "rg-terraform"
  location = "eastus"   
}

  backend "azurerm" {
    resource_group_name = "azurerm_resource_group.rg.name"
    storage_account_name = "azurerm_storage_account.jkstg.name"
    container_name = "jktf-dev-backend"
    key = "dev-terraform.tfstate"
  }
resource "azurerm_storage_account" "jkstg" {
  name                     = "jkstgaccount"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
