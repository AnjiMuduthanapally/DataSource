terraform {
  cloud {
    organization = "hashicorpcloud-learn"

    workspaces {
      name = "Vnet-workspace"
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
  name = "data_source_condition_check-rg"
}
resource "azurerm_virtual_network" "example" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "test_subnet" {
    name = "${lookup(element(var.subnet_prefix, count.index), "name")}"
    count = "${length(var.subnet_prefix)}"
    resource_group_name = "${local.resource_group_name}"
    virtual_network_name = "${azurerm_virtual_network.lab_vnet.name}"
    address_prefix = "${lookup(element(var.subnet_prefix, count.index), "ip")}"
}

