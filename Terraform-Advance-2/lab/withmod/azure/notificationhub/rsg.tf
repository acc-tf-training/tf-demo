#########################################################################
# Create the Main Resource Group                                        #
#########################################################################

module "rsg" {
  source     = "github.com/acc-tf-training/tf-modules/azure/rsg"
  name       = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_rsg}${var.environment}10"
  location   = var.pri_location
}
