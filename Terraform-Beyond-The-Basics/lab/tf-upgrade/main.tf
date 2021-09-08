terraform {
  required_providers {
    azurerm = {
      #source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
  }
  required_version = "~> 0.12.29"
}

provider "azurerm" {
  features {}
}

variable "rg_name" {
  type    = string
  default = "my-rg"
}

resource "azurerm_resource_group" "main" {
  name     = var.rg_name
  location = "West Europe"
}
