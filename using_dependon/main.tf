terraform {
  cloud {
    organization = "hashicorpcloud-learn"

    workspaces {
      name = "datasource-wrokspace"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
resource "azurerm_resource_group" "main" {
  name     = var.rg_name
  location = var.rg_location
}
data "azurerm_resource_group" "main" {
  name = "data_soruce-rg"
  depends_on = [
    azurerm_resource_group.main
  ]

}
resource "azurerm_storage_account" "example" {
  name                     = "mycheckstorage"
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"


  tags = {
    environment = "staging"
  }
}

