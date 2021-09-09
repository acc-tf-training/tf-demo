##############################################################################
#          Create the Azure Container Registry                               #
##############################################################################

module "acr" {
  source              = "github.com/acc-tf-training/tf-modules/azure/acr"
  name                = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_acr}${var.environment}01"
  location            = module.rsg.location
  resource_group_name = module.rsg.name
  sku                 = var.acr_sku
  tags                = module.ctag.tags
  subscription_id     = module.local_sub.subscription_id
  admin_enabled       = var.acr_admin_enabled
  network_rs_default_action = "Allow"
  #content_trust           = true
  #allow_ip_ranges    = ["117.217.237.144/32"]
  #allowed_subnet_ids = [module.vnt.subnets.0]
  depends_on          = [module.azcli]
}
