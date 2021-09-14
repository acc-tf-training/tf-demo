# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}


module "mystorage" {
    source = "./storage"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    name     = var.storage_list[0]
}
