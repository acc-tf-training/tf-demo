module "notificationhub" {
  source  = "github.com/acc-tf-training/tf-modules/azure/notificationhub"
  hub_namespace_name  = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_noh}${var.environment}01"
  name                = ["first-hub","second-hub"]
  resource_group_name  = module.rsg.name
  location             = module.rsg.location
}

