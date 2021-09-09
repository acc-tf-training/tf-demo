#######################################################
#          Common Project Tagging                     #
#######################################################

variable "owner" {
  description = "Dept Owner"
  type        = string
}

variable "cost_center" {
  description = "cost_center of the project"
  type        = string
}

variable "application" {
  description = "Name of the application"
  type        = string
}


#######################################################
#          Common Project Code                        #
#######################################################


variable "bu_name" {
  description = "Name of the BU"
  type        = string
}

variable "cloud_code" {
  description = "Name of Cloud Code"
  type        = string
}

variable "project_name" {
  description = "Name of the Project"
  type        = string
}


variable "environment" {
  description = "Name of the enviorment"
  type        = string
}

variable "hub_environment" {
  description = "Name of the hub enviorment"
  type        = string
}


#######################################################
#          Resource Group  Details                    #
#######################################################




variable "pri_location" {
  description = "Resource Group Location"
  type        = string
}


variable "lock_level" {
  description = "Specifies the Level to be used for this RG Lock. Possible values are Empty (no lock), CanNotDelete and ReadOnly."
  type        = string
}




#######################################################
#          Commmon Cloud Service Code                 #
#######################################################


variable "csc_sub" {
  description = "Cloud Service Code for Subscription"
  type        = string
  default     = "sub"
}

variable "csc_rsg" {
  description = "Cloud Service Code for ResourceGroup"
  type        = string
  default     = "rsg"
}


variable "csc_amg" {
  description = "Cloud Service Code for Azure Management Group"
  type        = string
  default     = "amg"
}


variable "csc_acr" {
  description = "Cloud Service Code for Azure Container Registry"
  type        = string
  default     = "acr"
}

variable "csc_vnt" {
  description = "Cloud Service Code for Azure Virtual network"
  type        = string
  default     = "vnt"
}

variable "csc_mysql" {
  description = "Cloud Service Code for Azure Mysql DB"
  type        = string
  default     = "msl"
}

variable "csc_aks" {
  description = "Cloud Service Code for Azure Kubernetes Cluster"
  type        = string
  default     = "aks"
}

variable "csc_aac" {
  description = "Cloud Service Code for Azure Automation Account"
  type        = string
  default     = "aac"
}

variable "csc_law" {
  description = "Cloud Service Code for Azure Log Analytics"
  type        = string
  default     = "law"
}


variable "csc_cis" {
  description = "Cloud Service Code for Azure Log Analytics ContainerInsights Solution"
  type        = string
  default     = "cis"
}

variable "csc_snt" {
  description = "Cloud Service Code for Azure Subnet"
  type        = string
  default     = "snt"
}

variable "csc_nsg" {
  description = "Cloud Service Code for Azure Network Security Group"
  type        = string
  default     = "nsg"
}

variable "csc_kms" {
  description = "Cloud Service Code for Azure Key Vault"
  type        = string
  default     = "kms"
}


variable "csc_agw" {
  description = "Cloud Service Code for Azure application Gateway"
  type        = string
  default     = "agw"
}


variable "csc_pip" {
  description = "Cloud Service Code for Azure Public  IP address"
  type        = string
  default     = "pip"
}


variable "csc_sta" {
  description = "Cloud Service Code for Storage Account"
  type        = string
  default     = "sta"
}

variable "csc_sfs" {
  description = "Cloud Service Code for Storage Account file share"
  type        = string
  default     = "sfs"
}

variable "csc_ada" {
  description = "Cloud Service Code for Azure Application Registration"
  type        = string
  default     = "ada"
}


variable "csc_rtb" {
  description = "Cloud Service Code for Azure Route Table"
  type        = string
  default     = "rtb"
}


variable "csc_afw" {
  description = "Cloud Service Code for Azure Firewall"
  type        = string
  default     = "afw"
}

variable "csc_avm" {
  description = "Cloud Service Code for Azure Virtual Machine"
  type        = string
  default     = "vm"
}



variable "csc_avs" {
  description = "Cloud Service Code for Avablity Set"
  type        = string
  default     = "avs"
}





#######################################################
#          AKS & ACR                                  #
#######################################################


variable "aks_agents_size" {
  description = "AKS  Node  Size"
  type        = string
}

variable "aks_agents_count" {
  description = "AKS Kubernetes Node Count"
  type        = number
}


variable "aks_k8s_version" {
  description = "AKS Kubernetes Version"
  type        = string
}

variable "acr_sku" {
  description = "SKU of ACR"
  type        = string
}

variable "acr_admin_enabled" {
  description = "Enable Admin account of  ACR"
  type        = string
  default     = false
}

variable "aks_add_vm_size" {
  description = "Addtional Node Pool VM Size"
  type        = list
}

variable "aks_os_type" {
  description = "What is the OS Type"
  type        = list
}

variable "aks_add_node_count" {
  description = "Addtional Node Pool Node Count"
  type        = list(number)
}

variable "aks_enable_auto_scaling" {
  description = "Enable AutoScaling in AKS Cluster"
  type        = string
}

variable "aks_azure_policy_enabled" {
  description = "Enable Azure Policy for AKS"
  type        = string
}

variable "aks_add_pool_names" {
  description = "Names of the addtional node pools"
  type        = list
}

variable "role_based_access_control_enabled" {
  description = "Enabled Role Based Access Control for AKS"
  type        = bool
}

variable "aks_privatecluster" {
  description = "Enabled Private AKS cluster"
  type        = bool
}




#######################################################
#         Network Details                             #
#######################################################



variable "vnt_address_space" {
  description = "Address Space of Virtual Network"
  type        = list
}

variable "vnt_snt_address_spaces" {
  description = "List of Address Space of Subnet"
  type        = list
}

variable "subnet_names" {
  description = "List of Subnet Name"
  type        = list
}


#######################################################
#         Network Security Group                      #
#######################################################


variable "nsg_name" {
  description = "Name of the Security Group"
  type        = list
}



########################################################
#       Azure CLI                                      #
########################################################

variable "azcli_service_principal" {
  description = "Azure Service principal for Azure CLI"
  type        = string
}

variable "azcli_service_principal_key" {
  description = "Azure Service principal Key for Azure CLI"
  type        = string
}


###################################################################
#              Mgt Subnet                                         #
###################################################################


variable "mgt_subnet_name" {
  description = "Name of Subnet of Devops Agent VM"
  type        = string
}
