environment                      = "dev"
vnt_address_space                =  ["172.19.146.0/23"]
vnt_snt_address_spaces           =  ["172.19.146.0/24","172.19.147.0/24"]
aks_add_vm_size                  =  ["Standard_B2s"]
hub_environment                  = "hub"
bu_name                          = "am"
cloud_code                       = "az"
project_name                     = "amr"
owner                            = "amr"
cost_center                      = "amr1010"
application                      = "amr"
pri_location                     = "eastus"
lock_level                       = "CanNotDelete"
acr_sku                          = "premium"
aks_agents_size                  = "Standard_B2s"
aks_agents_count                 = 1
aks_add_pool_names               = []
aks_add_node_count               = [1]
aks_os_type                      = ["Linux"]
aks_k8s_version                  = "1.18.17"
aks_enable_auto_scaling          = false
aks_azure_policy_enabled         = false
role_based_access_control_enabled = false
subnet_names                     = ["AppSubnet01","AppSubnet02"]
nsg_name                         = ["AppSubnet01-NSG","AppSubnet02-NSG"]
mgt_subnet_name                  = "MgmtSubnet"
aks_privatecluster               = false 
