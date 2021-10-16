module "ssh-key" {
  source         = "./modules/ssh-key"
  public_ssh_key = var.public_ssh_key == "" ? "" : var.public_ssh_key
}

#resource "azurerm_private_dns_zone" "example" {
#  name                = "privatelink.eastus.azmk8s.io"
#  resource_group_name = var.resource_group_name
#}

resource "azurerm_user_assigned_identity" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
}


resource "azurerm_kubernetes_cluster" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.name
  

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      # remove any new lines using the replace interpolation function
      key_data = replace(var.public_ssh_key == "" ? module.ssh-key.public_ssh_key : var.public_ssh_key, "\n", "")
    }
  }

  default_node_pool {
    name            = "dnodepool"
    type            = var.agent_profile_type
    node_count      = var.agents_count
    vm_size         = var.agents_size
    os_disk_size_gb = var.os_disk_size_gb
    vnet_subnet_id  = var.vnet_subnet_id
    enable_auto_scaling = var.enable_auto_scaling
    max_count = var.agent_pool_autoscaling_max_count
    min_count = var.agent_pool_autoscaling_min_count
    max_pods  = var.network_plugin == "kubenet" ? 110 : var.dnodepool_max_pods
    availability_zones  = ["1", "2"]
  }

 
  kubernetes_version = var.kubernetes_version
  
  
  node_resource_group  = var.node_resource_group

  #api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  
  identity {
    type = "UserAssigned"
    user_assigned_identity_id =  replace(azurerm_user_assigned_identity.example.id,"resourceGroups","resourcegroups")
  }
  

  addon_profile {
    http_application_routing {
      enabled = var.enable_http_application_routing
    }
  
    aci_connector_linux {
     enabled = var.virtual_nodes_enabled
  }

    azure_policy  {
     enabled = var.azure_policy_enabled
  }
  
  kube_dashboard {
    enabled = var.kube_dashboard
  }
  
#  dynamic oms_agent {
#      for_each = var.enable_log_analytics_workspace ? ["log_analytics"] : []
#      content {
#        enabled                    = true
#        log_analytics_workspace_id = var.log_analytics_workspace_id
#        #oms_agent_identity         =
#      }
#    }

  }
  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_plugin == "kubenet" ? null : var.network_policy
    dns_service_ip = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr = var.service_cidr
  } 


  tags = var.tags


  }

resource "azurerm_role_assignment" "networkcontributor_role" {
  scope                            = var.id
  role_definition_name             = "Network Contributor"
  principal_id                     = azurerm_user_assigned_identity.example.principal_id
  skip_service_principal_aad_check = true
}


resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = var.container_registry_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_user_assigned_identity.example.principal_id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "kubelet_identity_acrpull_role" {
  scope                            = var.container_registry_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity.0.object_id 
  skip_service_principal_aad_check = true
}

 resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
 count                 = var.add_pool_names == [] ? 0 : length(var.add_pool_names) 
 name                  = var.add_pool_names[count.index]
 kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
 os_type               = lookup(var.os_type, var.add_pool_names[count.index], null)
 enable_auto_scaling   = var.enable_auto_scaling
 vnet_subnet_id        = var.vnet_subnet_id
 vm_size               = lookup(var.vm_size, var.add_pool_names[count.index], null)
 node_count            = lookup(var.node_count, var.add_pool_names[count.index], null)
 max_count             = var.agent_pool_autoscaling_max_count
 min_count             = var.agent_pool_autoscaling_min_count
 max_pods              = var.network_plugin == "kubenet" ? 110 : var.max_pods 
 node_labels           = var.nodelabels[count.index]
 tags                  = var.tags
 availability_zones  = ["1", "2", "3"]
}
/*
resource "null_resource" "acr" {

  triggers = {
    acr_id = var.acr_id
  }

  provisioner "local-exec" {
    command = "sudo az login --service-principal -u  ${var.service_principal} -p ${var.service_principal_key} --tenant ${var.tenant};sudo az account set --subscription ${var.subscription_id};sudo az aks update --name ${azurerm_kubernetes_cluster.main.name} --resource-group ${azurerm_kubernetes_cluster.main.resource_group_name} --attach-acr ${var.acr_id}"
  }

  depends_on = [azurerm_kubernetes_cluster.main,azurerm_kubernetes_cluster_node_pool.node_pool]
}
*/
