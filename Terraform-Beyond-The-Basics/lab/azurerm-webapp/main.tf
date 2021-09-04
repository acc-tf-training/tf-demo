provider "azurerm" {
    }

resource "azurerm_resource_group" "example" {
  name     = "Enter Resource Group Name"
  location = "eastus"
}

resource "azurerm_app_service_plan" "svcplan" {
  name                = "Enter App Service Plan name"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "Enter Web App Service Name"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}