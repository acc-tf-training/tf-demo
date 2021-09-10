module "law" {
          source                        = "github.com/acc-tf-training/tf-modules/azure/law"
          name                          = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_law}${var.environment}01"
          resource_group_name           =  module.rsg.name
          location                      =  module.rsg.location
}
