provider "aws" {
  region   = "us-east-1"
}

provider "azurerm" {
  features {}
}


resource "aws_sns_topic" "topic-us-east" {
  name     = "topic-us-east"
}

resource "azurerm_resource_group" "example" {
  name     = "notificationhub-resources"
  location = "East Us"
}

resource "azurerm_notification_hub_namespace" "example" {
  name                = "myappnamespace-rethesh"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  namespace_type      = "NotificationHub"

  sku_name = "Free"
}

resource "azurerm_notification_hub" "example" {
  name                = "mynotificationhub"
  namespace_name      = azurerm_notification_hub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
