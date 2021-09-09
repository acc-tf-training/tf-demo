##############################################################################
#          Fetching the details of  Azure Container Registry                 #
##############################################################################
#
#module "data_acr" {
#    source              = "../../modules//azure/data_acr"
#    name                = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_acr}${var.hub_environment}10"
#    resource_group_name = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_rsg}${var.hub_environment}10"
#    subscription_id     =  module.remote_sub_hub.subscription_id
#}

##############################################################################
#          Create the Azure Kubernetes Cluster                               #
##############################################################################
  

module "aks" {
  source                        = "github.com/acc-tf-training/tf-modules/azure/aks"
  name                          = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_aks}${var.environment}10"
  kubernetes_version            =  var.aks_k8s_version
  resource_group_name           =  module.rsg.name
  location                      =  module.rsg.location
  privatecluster                =  var.aks_privatecluster
  agents_count                  =  var.aks_agents_count
  network_plugin                =  "azure"
  agents_size                   =  var.aks_agents_size
  id                            =  module.local_sub.id
  subscription_id               =  module.local_sub.subscription_id
  container_registry_id         = module.acr.id
  vnet_subnet_id                =  module.vnt.subnets.0
  log_analytics_workspace_id    = module.law.id
  azure_policy_enabled          = var.aks_azure_policy_enabled
  role_based_access_control_enabled = var.role_based_access_control_enabled
  enable_auto_scaling           = var.aks_enable_auto_scaling
  node_resource_group           = "${module.rsg.name}_${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_aks}${var.environment}10"
  add_pool_names                = var.aks_add_pool_names
  acr_id                        = module.acr.id
  service_principal             = var.azcli_service_principal
  service_principal_key         = var.azcli_service_principal_key
  tenant                        = module.local_sub.tenant_id
  api_server_authorized_ip_ranges = ["0.0.0.0/0"]
  vm_size                       = {
                "anodepool01" =  var.aks_add_vm_size[0]
}
node_count                    = {
                "anodepool01" =  var.aks_add_node_count[0]
}
os_type                    = {
              "anodepool01" =  var.aks_os_type[0]
}
  tags = module.ctag.tags
}


#############################################################################################################################
#          Assign the Azure Kubernetes Cluster Principal Id To  Network Role On HUB  Subscription                           #
#############################################################################################################################



# module aks_kmsuser {
#     source                  =  "../../modules//azure/iam_role_asgmt"
#     scope                   =  module.aks.aks_id
#     role_definition_name    = "Contributor"
#     principal_id            =  module.kms_aad_svc.object_id
# }

##############################################################################
#          Create the Kubernetes Namespace on AKS Cluster                    #
##############################################################################


module "aks_ns" {
     source                 = "github.com/acc-tf-training/tf-modules/kubernetes/namespace"
     host                   = module.aks.host
     client_certificate     = module.aks.client_certificate
     client_key             = module.aks.client_key
     cluster_ca_certificate = module.aks.cluster_ca_certificate
     namespace_names        = [var.environment]
 }
