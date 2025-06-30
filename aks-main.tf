terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.24.0"
    }
  }
}
provider "azurerm" {
    subscription_id = "a0375fab-9657-42bc-b9a6-a77e7985af70"
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = "spaincentral"
#   managed_by = ""
  name       = "sethuaks"
  tags       = {}
}
resource "azurerm_kubernetes_cluster" "res-1" {
  automatic_upgrade_channel           = "patch"
  azure_policy_enabled                = false
  cost_analysis_enabled               = false
#   disk_encryption_set_id              = ""
  dns_prefix                          = "ssaks-dns"
#   dns_prefix_private_cluster          = ""
#   edge_zone                           = ""
  http_application_routing_enabled    = false
  image_cleaner_enabled               = true
  image_cleaner_interval_hours        = 168
#   kube_admin_config                   = [] # Masked sensitive attribute
#   kube_admin_config_raw               = "" # Masked sensitive attribute
#   kube_config                         = [] # Masked sensitive attribute
#   kube_config_raw                     = "" # Masked sensitive attribute
  kubernetes_version                  = "1.31.8"
  local_account_disabled              = false
  location                            = "centralindia"
  name                                = "ssaks"
  node_os_upgrade_channel             = "NodeImage"
  node_resource_group                 = "MC_sethuaks_ssaks_japanwest"
  oidc_issuer_enabled                 = true
  open_service_mesh_enabled           = false
  private_cluster_enabled             = false
  private_cluster_public_fqdn_enabled = false
#   private_dns_zone_id                 = ""
  resource_group_name                 = "sethuaks"
  role_based_access_control_enabled   = true
  run_command_enabled                 = true
  sku_tier                            = "Free"
  support_plan                        = "KubernetesOfficial"
  tags                                = {}
  workload_identity_enabled           = true
  auto_scaler_profile {
    balance_similar_node_groups                   = false
    daemonset_eviction_for_empty_nodes_enabled    = false
    daemonset_eviction_for_occupied_nodes_enabled = true
    empty_bulk_delete_max                         = "10"
    expander                                      = "random"
    ignore_daemonsets_utilization_enabled         = false
    max_graceful_termination_sec                  = "600"
    max_node_provisioning_time                    = "15m"
    max_unready_nodes                             = 3
    max_unready_percentage                        = 45
    new_pod_scale_up_delay                        = "0s"
    scale_down_delay_after_add                    = "10m"
    scale_down_delay_after_delete                 = "10s"
    scale_down_delay_after_failure                = "3m"
    scale_down_unneeded                           = "10m"
    scale_down_unready                            = "20m"
    scale_down_utilization_threshold              = "0.5"
    scan_interval                                 = "10s"
    skip_nodes_with_local_storage                 = false
    skip_nodes_with_system_pods                   = true
  }
  default_node_pool {
    auto_scaling_enabled          = true
    # capacity_reservation_group_id = ""
    fips_enabled                  = false
    # gpu_instance                  = ""
    host_encryption_enabled       = false
    # host_group_id                 = ""
    kubelet_disk_type             = "OS"
    max_count                     = 5
    max_pods                      = 110
    min_count                     = 2
    name                          = "agentpool"
    node_count                    = 2
    node_labels                   = {}
    node_public_ip_enabled        = false
    # node_public_ip_prefix_id      = ""
    only_critical_addons_enabled  = false
    orchestrator_version          = "1.31.8"
    os_disk_size_gb               = 128
    os_disk_type                  = "Managed"
    os_sku                        = "Ubuntu"
    # pod_subnet_id                 = ""
    # proximity_placement_group_id  = ""
    scale_down_mode               = "Delete"
    # snapshot_id                   = ""
    tags                          = {}
    # temporary_name_for_rotation   = ""
    type                          = "VirtualMachineScaleSets"
    ultra_ssd_enabled             = false
    vm_size                       = "Standard_D2pds_v5"
    # vnet_subnet_id                = ""
    # workload_runtime              = ""
    zones                         = ["1", "2", "3"]
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
#   kubelet_identity {
#     client_id                 = "f5dba0dd-a8d8-451b-9760-7a747d4b215c"
#     object_id                 = "ba8fab2e-2baa-4949-ae75-bcd6a5a51fef"
#     user_assigned_identity_id = "/subscriptions/a0375fab-9657-42bc-b9a6-a77e7985af70/resourceGroups/MC_sethuaks_ssaks_japanwest/providers/Microsoft.ManagedIdentity/userAssignedIdentities/ssaks-agentpool"
#   }
  maintenance_window_auto_upgrade {
    day_of_month = 0
    day_of_week  = "Sunday"
    duration     = 8
    frequency    = "Weekly"
    interval     = 1
    start_date   = "2025-07-01T00:00:00Z"
    start_time   = "00:00"
    utc_offset   = "+00:00"
    # week_index   = ""
  }
  maintenance_window_node_os {
    day_of_month = 0
    day_of_week  = "Sunday"
    duration     = 8
    frequency    = "Weekly"
    interval     = 1
    start_date   = "2025-07-01T00:00:00Z"
    start_time   = "00:00"
    utc_offset   = "+00:00"
    # week_index   = ""
  }
  network_profile {
    dns_service_ip      = "10.0.0.10"
    ip_versions         = ["IPv4"]
    load_balancer_sku   = "standard"
    network_data_plane  = "azure"
    # network_mode        = ""
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    # network_policy      = ""
    outbound_type       = "loadBalancer"
    pod_cidr            = "10.244.0.0/16"
    pod_cidrs           = ["10.244.0.0/16"]
    service_cidr        = "10.0.0.0/16"
    service_cidrs       = ["10.0.0.0/16"]
    load_balancer_profile {
      backend_pool_type           = "NodeIPConfiguration"
      idle_timeout_in_minutes     = 4
      managed_outbound_ip_count   = 1
    #   managed_outbound_ipv6_count = 0
    #   outbound_ip_address_ids     = []
    #   outbound_ip_prefix_ids      = []
      outbound_ports_allocated    = 0
    }
  }
  windows_profile {
    admin_password = "Sethu@12345678910" # Masked sensitive attribute
    admin_username = "azureuser"
    # license        = ""
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
# resource "azurerm_kubernetes_cluster_node_pool" "res-2" {
#   auto_scaling_enabled          = true
# #   capacity_reservation_group_id = ""
# #   eviction_policy               = ""
#   fips_enabled                  = false
#   host_encryption_enabled       = false
# #   host_group_id                 = ""
#   kubelet_disk_type             = "OS"
#   kubernetes_cluster_id         = azurerm_kubernetes_cluster.res-1.id
#   max_count                     = 5
#   max_pods                      = 110
#   min_count                     = 2
#   mode                          = "System"
#   name                          = "agentpool"
#   node_count                    = 2
#   node_labels                   = {}
#   node_public_ip_enabled        = false
# #   node_public_ip_prefix_id      = ""
#   node_taints                   = []
#   orchestrator_version          = "1.31.8"
#   os_disk_size_gb               = 128
#   os_disk_type                  = "Managed"
#   os_sku                        = "Ubuntu"
#   os_type                       = "Linux"
# #   pod_subnet_id                 = ""
#   priority                      = "Regular"
# #   proximity_placement_group_id  = ""
#   scale_down_mode               = "Delete"
#   spot_max_price                = -1
#   tags                          = {}
#   ultra_ssd_enabled             = false
#   vm_size                       = "Standard_D2pds_v5"
# #   vnet_subnet_id                = ""
#   zones                         = ["1", "2", "3"]
#   upgrade_settings {
#     drain_timeout_in_minutes      = 0
#     max_surge                     = "10%"
#     node_soak_duration_in_minutes = 0
#   }
# }
