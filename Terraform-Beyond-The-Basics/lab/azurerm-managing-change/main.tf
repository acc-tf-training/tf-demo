
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "example" {
  name     = "mygroup"
  location = "eastus"
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "CloudDhosth"
  address_space       = ["10.0.0.0/16"]
  location            = "Central US"
  resource_group_name = azurerm_resource_group.example.name
# Create Tag
#tags = {
#  Environment = "Dev"
#  Team        = "Cloud"
#}
}
