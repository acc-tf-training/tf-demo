#######################################################
#          Define the Terraform provider              #
#######################################################

provider "azurerm" {
   version = "~> 2.57.0"
   features {
      key_vault {
      purge_soft_delete_on_destroy = true
    }
   }
}


provider "azuread" {
   version = "~> 1.0.0"
}