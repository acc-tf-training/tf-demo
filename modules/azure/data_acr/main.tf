provider "azurerm" {
  alias           = "remote_sub"
  subscription_id =  var.subscription_id
  features {}
}

data "azurerm_container_registry" "acr" {
  provider            = azurerm.remote_sub
  name                = var.name
  resource_group_name = var.resource_group_name
}