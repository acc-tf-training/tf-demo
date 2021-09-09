terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
    mysql = {
      source = "terraform-providers/mysql"
    }
  }
  required_version = ">= 0.13"
}
