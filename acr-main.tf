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
  location   = "westus2"
#   managed_by = ""
  name       = "sethuacr1234"
  tags       = {}
}
resource "azurerm_container_registry" "res-1" {
    admin_enabled                 = "true"
#   admin_password                = "" # Masked sensitive attribute
#   anonymous_pull_enabled        = false
#   data_endpoint_enabled         = false
#   encryption                    = []
#   export_policy_enabled         = true
  location                      = "westus2"
  name                          = "sethuacr123"
#   network_rule_bypass_option    = "AzureServices"
#   network_rule_set              = []
#   public_network_access_enabled = true
#   quarantine_policy_enabled     = false
  resource_group_name           = "azurerm_resource_group.res-0.namer"
#   retention_policy_in_days      = 0
  sku                           = "Standard"
#   admin_enabled                 = "true"
#   tags                          = {}
#   trust_policy_enabled          = false
#   zone_redundancy_enabled       = false
#   depends_on = [
#     azurerm_resource_group.res-0
#   ]
# }
# resource "azurerm_container_registry_scope_map" "res-2" {
#   actions                 = ["repositories/*/metadata/read", "repositories/*/metadata/write", "repositories/*/content/read", "repositories/*/content/write", "repositories/*/content/delete"]
#   container_registry_name = "sethu11acr"
#   description             = "Can perform all read, write and delete operations on the registry"
#   name                    = "_repositories_admin"
#   resource_group_name     = "sethuacr"
#   depends_on = [
#     azurerm_container_registry.res-1
#   ]
}
# resource "azurerm_container_registry_scope_map" "res-3" {
#   actions                 = ["repositories/*/content/read"]
#   container_registry_name = "sethu11acr"
#   description             = "Can pull any repository of the registry"
#   name                    = "_repositories_pull"
#   resource_group_name     = "sethuacr"
#   depends_on = [
#     azurerm_container_registry.res-1
#   ]
# }
# resource "azurerm_container_registry_scope_map" "res-4" {
#   actions                 = ["repositories/*/content/read", "repositories/*/metadata/read"]
#   container_registry_name = "sethu11acr"
#   description             = "Can perform all read operations on the registry"
#   name                    = "_repositories_pull_metadata_read"
#   resource_group_name     = "sethuacr"
#   depends_on = [
#     azurerm_container_registry.res-1
#   ]
# }
# resource "azurerm_container_registry_scope_map" "res-5" {
#   actions                 = ["repositories/*/content/read", "repositories/*/content/write"]
#   container_registry_name = "sethu11acr"
#   description             = "Can push to any repository of the registry"
#   name                    = "_repositories_push"
#   resource_group_name     = "sethuacr"
#   depends_on = [
#     azurerm_container_registry.res-1
#   ]
# }
# resource "azurerm_container_registry_scope_map" "res-6" {
#   actions                 = ["repositories/*/metadata/read", "repositories/*/metadata/write", "repositories/*/content/read", "repositories/*/content/write"]
#   container_registry_name = "sethu11acr"
#   description             = "Can perform all read and write operations on the registry"
#   name                    = "_repositories_push_metadata_write"
#   resource_group_name     = "sethuacr"
#   depends_on = [
#     azurerm_container_registry.res-1
#   ]
# }
