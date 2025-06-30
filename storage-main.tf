terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "~> 3.104"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = "westus3"
#   managed_by = ""
  name       = "ss1-rg"
  tags       = {}
}
resource "azurerm_storage_account" "res-1" {
  name                     = "sethumadavstorage"
  resource_group_name      = azurerm_resource_group.res-0.name
  location                 = azurerm_resource_group.res-0.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}

resource "azurerm_storage_container" "res-3" {
  name                  = "sscontainer"
  storage_account_name    = azurerm_storage_account.res-1.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "uploaded_file" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.res-1.name
  storage_container_name = azurerm_storage_container.res-3.name
  type                   = "Block"
  source                 = "index.html"
}
