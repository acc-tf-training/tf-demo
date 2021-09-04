variable "resource_group_name" {
  description = "The resource group name to be imported"
  type        = string
}

variable "name" {
  description = "Name of the AKS Cluster"
  type        = string
}

variable "location" {
  description = "Location of the AKS Cluster"
  type        = string
}

variable "admin_username" {
  default     = "azureuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
  type        = string
}

variable "agents_size" {
  default     = "Standard_D2s_v3"
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
}



variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
  type        = number
  default     = 3
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster"
  type        = string
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}


variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 100
}

variable "privatecluster" {
  description = "Enable private cluster (forces recreation)."
  type        = bool
  default     = false
}

variable "enable_http_application_routing" {
  description = "Enable HTTP Application Routing Addon (forces recreation)."
  type        = bool
  default     = false
}

variable "agent_profile_type" {
  description = "agent node types,whether vmss or availability set"
  type        = string
  default = "VirtualMachineScaleSets"

}

variable "enable_auto_scaling" {
  description = "enable autoscaling for aks cluster"
  default = "false"
}

variable "agent_pool_autoscaling_max_count" {
  description = "max number of nodes"
  default = null
}

variable "agent_pool_autoscaling_min_count" {
  description = "min number of nodes"
  default = null
}

variable "kubernetes_version" {
  description = "kubernetes version"
  default = "default"
}

variable "private_cluster_enabled" {
  default = false
}

variable "enable_log_analytics_workspace" {
  type        = bool
  description = "Enable the creation of azurerm_log_analytics_workspace and azurerm_log_analytics_solution or not"
  default     = true
}

variable "kube_dashboard" {
  description = "enable kubernetes dashboard"
  default = "true"
}

variable "identity_type" {
  description = "Type of MSI to be enabled"
  default = "SystemAssigned"
}

variable "virtual_nodes_enabled" {
  default = "false"
}

variable "network_plugin" {
  description = "Network pulgin for AKS Cluster"
  type    = string 
  default = "kubenet"
}

variable "network_policy" {
  description = "Network Policy for AKS Cluster"
  type    = string 
  default = "azure"
}

variable "dns_service_ip" {
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)."
  default = "10.0.0.10"
}

variable "docker_bridge_cidr" {
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes"
  default = "172.17.0.1/16"
}

variable "service_cidr" {
  description = "The Network Range used by the Kubernetes service. Changing this forces a new resource to be created."
  default = "10.0.0.0/16"
}

variable "container_registry_id" {
  description = "ACR ID to which aks is attached"
  type        = string
  default     = null
}

variable "id" {
  description = "Subscription id of the subscription to which aks is deployed"
  type        = string
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace id to which aks cluster will be connected"
  type        = string
  default     = null
}

variable "role_based_access_control_enabled" {
  description = "Enabled Role Based Access Control for AKS"
  type        = bool
  default     = false
}

variable "add_pool_names" {
  description = "Name of the Node Pool"
  type        = list
  default     = []
}

variable "acr_id" {
  description = "Resource ID of ACR"
  type        = string
}

variable "vm_size" {
  description = "VM Size of the node pool"
  type        = map(any)
  default     = {}
}

variable "node_count" {
  description = "Node Count of the node pool"
  type        = map(any)
  default     = {}
}

variable "load_balancer_sku" {
  description = "Load Balancer Sku for AKS"
  type        = string
  default     = "Standard"
}

variable "azure_policy_enabled" {
  description = "Enabled Azure Policy for AKS"
  type        = bool
  default     = true
}

variable "node_resource_group" {
  description = "Name of the AKS Node Resource Group"
  type        = string
  default     = null
}


variable "dnodepool_max_pods" {
  description = "The maximum number of pods that can run on each node for default node pool"
  type        = number
  default     = 30
}


variable "anodepool_max_pods" {
  description = "The maximum number of pods that can run on each node for additonal node pool"
  type        = number
  default     = 10
}

variable "max_pods" {
  description = "The maximum number of pods that can run on each node for default node pool"
  type        = number
  default     = 30
}


variable "os_type" {
  description = "What is the OS Type"
  type        = map(any)
  default     = {}
}



variable "service_principal" {
  description = "Azure Service Principal Details"
  type        = string
}

variable "service_principal_key" {
  description = "Azure Service Principal Key"
  type        = string
}


variable "tenant" {
  description = "Azure Active Directory tenant"
  type        = string
}


variable "api_server_authorized_ip_ranges" {
  description = "List of IP ranges authorized"
  type        = list
  default     = []
}



variable "subscription_id" {
  description = "Subscription id of the subscription to which aks is deployed"
  type        = string
  default     = null
}

variable "nodelabels" {
description = "Node pool labels"
type = list
default = [
  # Values must follow CIDR notation, so /32 or /27 or /24 or something
 {
      "pool": "app",
      "os": "linux"
 }
 ,
 {
      "pool": "win",
      "os": "windows"
 }
]

}