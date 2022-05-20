provider "azurerm" {
    features {
      
    }
  subscription_id = "3e68b387-c893-46d3-8c09-855b307d65a4"
  client_id       = "dc9bf6c5-0cc8-4bb2-979e-43b75f6d8398"
  client_secret   = "Ag88Q~dTLNGnge7sfg6EWtLLTEcGKv6KHtZKIddY"
  tenant_id       = "d08a11c9-264f-4371-82d4-b20e9d8257b9"
  
}

resource "azurerm_resource_group" "main" {
  name = var.rg_name
  location = var.rg_location
}