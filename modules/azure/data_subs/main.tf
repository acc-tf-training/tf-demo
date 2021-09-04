data "azurerm_subscriptions" "available" {
       display_name_contains = var.display_name_contains 
}