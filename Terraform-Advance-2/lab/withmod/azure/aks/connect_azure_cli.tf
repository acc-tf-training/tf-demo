module "azcli" {
  source                = "../../modules//azure/cli"
  service_principal     = var.azcli_service_principal
  service_principal_key = var.azcli_service_principal_key
  tenant                = module.local_sub.tenant_id
}