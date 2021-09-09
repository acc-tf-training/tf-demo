#########################################################################
# Fetching the Subscription ID of the Current Subscription              #
#########################################################################

module "local_sub" {
  source     = "github.com/acc-tf-training/tf-modules/azure/data_sub"
}


#########################################################################
# Fetching the Subscription ID of the Remote Subscription               #
#########################################################################


#########################################################################
# Define the Common Tags used                                           #
#########################################################################


module "ctag" {
  source      = "github.com/acc-tf-training/tf-modules/azure/ctag"
  owner       = var.owner
  cost_center = var.cost_center
  application = var.application
  environment = var.environment
}


#########################################################################
# Create the Main Resource Group                                        #
#########################################################################

module "rsg" {
  source     = "github.com/acc-tf-training/tf-modules/azure/rsg"
  name       = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_rsg}${var.environment}10"
  location   = var.pri_location
  tags       = module.ctag.tags
  #lock_level = var.lock_level
}
