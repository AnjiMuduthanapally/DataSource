terraform {
  cloud {
    organization = "hashicorpcloud-learn"

    workspaces {
      name = "datasource-wrokspace"
    }
  }
}

provider "azurerm" {
    features {
      
    }
  subscription_id = var.subscription_id
  client_id       = var.varclient_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  
}

resource "azurerm_resource_group" "main" {
  name = var.rg_name
  location = var.rg_location
}
