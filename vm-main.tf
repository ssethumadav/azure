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
#   managed_by = 
  name       = "ss-rg"
  tags       = {}
}
resource "azurerm_availability_set" "res-1" {
  location                     = "westus2"
  managed                      = true
  name                         = "ss-availablityset"
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  resource_group_name          = "ss-rg"
  tags                         = {}
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_linux_virtual_machine" "res-2" {
  admin_password                                         = "Sethu@1234567" # Masked sensitive attribute
  admin_username                                         = "sethu"
  allow_extension_operations                             = true
  availability_set_id                                    = "/subscriptions/a0375fab-9657-42bc-b9a6-a77e7985af70/resourceGroups/ss-rg/providers/Microsoft.Compute/availabilitySets/SS-AVAILABLITYSET"
  bypass_platform_safety_checks_on_user_schedule_enabled = false
#   capacity_reservation_group_id                          = 
  computer_name                                          = "sethu"
#   custom_data                                            =  # Masked sensitive attribute
#   dedicated_host_group_id                                = 
#   dedicated_host_id                                      = 
  disable_password_authentication                        = false
  disk_controller_type                                   = "SCSI"
#   edge_zone                                              = 
  encryption_at_host_enabled                             = false
#   eviction_policy                                        = 
  extensions_time_budget                                 = "PT1H30M"
#   license_type                                           = 
  location                                               = "westus2"
  max_bid_price                                          = -1
  name                                                   = "sethu"
  network_interface_ids                                  = [azurerm_network_interface.res-3.id]
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"
#   platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
#   proximity_placement_group_id                           = 
#   reboot_setting                                         = 
  resource_group_name                                    = "ss-rg"
  secure_boot_enabled                                    = true
  size                                                   = "Standard_D2s_v3"
#   source_image_id                                        = 
  tags                                                   = {}
#   user_data                                              = 
#   virtual_machine_scale_set_id                           = 
  vm_agent_platform_updates_enabled                      = false
  vtpm_enabled                                           = true
#   zone                                                   = 
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
#   boot_diagnostics {
#     storage_account_uri = 
#   }
  os_disk {
    caching                          = "ReadWrite"
    # disk_encryption_set_id           = 
    disk_size_gb                     = 30
    name                             = "sethu_OsDisk_1_1db83224accb4be782f938bd2675b647"
    # secure_vm_disk_encryption_set_id = 
    # security_encryption_type         = 
    storage_account_type             = "StandardSSD_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "0001-com-ubuntu-minimal-jammy"
    publisher = "canonical"
    sku       = "minimal-22_04-lts-gen2"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "res-3" {
  accelerated_networking_enabled = true
#   auxiliary_mode                 = 
#   auxiliary_sku                  = 
  dns_servers                    = []
#   edge_zone                      = 
#   internal_dns_name_label        = 
  ip_forwarding_enabled          = false
  location                       = "westus2"
  name                           = "sethu960"
  resource_group_name            = "ss-rg"
  tags                           = {}
  ip_configuration {
    # gateway_load_balancer_frontend_ip_configuration_id = 
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.0.4"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-7.id
    subnet_id                                          = azurerm_subnet.res-9.id
  }
}
resource "azurerm_network_interface_security_group_association" "res-4" {
  network_interface_id      = azurerm_network_interface.res-3.id
  network_security_group_id = azurerm_network_security_group.res-5.id
}
resource "azurerm_network_security_group" "res-5" {
  location            = "westus2"
  name                = "sethu-nsg"
  resource_group_name = "ss-rg"
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "SSH"
    priority                                   = 300
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
# resource "azurerm_network_security_rule" "res-6" {
#   access                                     = "Allow"
#   description                                = 
#   destination_address_prefix                 = "*"
#   destination_address_prefixes               = []
#   destination_application_security_group_ids = []
#   destination_port_range                     = "22"
#   destination_port_ranges                    = []
#   direction                                  = "Inbound"
#   name                                       = "SSH"
#   network_security_group_name                = "sethu-nsg"
#   priority                                   = 300
#   protocol                                   = "Tcp"
#   resource_group_name                        = "ss-rg"
#   source_address_prefix                      = "*"
#   source_address_prefixes                    = []
#   source_application_security_group_ids      = []
#   source_port_range                          = "*"
#   source_port_ranges                         = []
#   depends_on = [
#     azurerm_network_security_group.res-5
#   ]
# }
resource "azurerm_public_ip" "res-7" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
#   edge_zone               = 
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westus2"
  name                    = "sethu-ip"
  resource_group_name     = "ss-rg"
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = []
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_virtual_network" "res-8" {
  address_space                  = ["10.0.0.0/16"]
#   bgp_community                  = 
  dns_servers                    = []
#   edge_zone                      = 
  flow_timeout_in_minutes        = 4
  location                       = "westus2"
  name                           = "sethu-vnet"
#   private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = "ss-rg"
#   subnet = [{
#     address_prefixes                              = ["10.0.0.0/24"]
#     default_outbound_access_enabled               = false
#     delegation                                    = []
#     id                                            = "/subscriptions/a0375fab-9657-42bc-b9a6-a77e7985af70/resourceGroups/ss-rg/providers/Microsoft.Network/virtualNetworks/sethu-vnet/subnets/default"
#     name                                          = "default"
#     private_endpoint_network_policies             = "Disabled"
#     private_link_service_network_policies_enabled = true
#     route_table_id                                = 
#     security_group                                = 
#     service_endpoint_policy_ids                   = []
#     service_endpoints                             = []
#   }]
  tags = {}
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_subnet" "res-9" {
  address_prefixes                              = ["10.0.0.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "default"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "ss-rg"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  virtual_network_name                          = "sethu-vnet"
  depends_on = [
    azurerm_virtual_network.res-8
  ]
}
