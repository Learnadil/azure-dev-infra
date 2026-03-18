resource "azure_resource_group" "rg" {
  name = "rg-terraform"
  location = "eastus"   
}

resource "azure_storage_account" "jkstg" {
  name                     = "jenkinsstorageacc"
  resource_group_name      = azure_resource_group.rg.name
  location                 = azure_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}