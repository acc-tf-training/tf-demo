output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

output "id" {
  value = data.azurerm_subscription.current.id
}

output "display_name" {
  value = data.azurerm_subscription.current.display_name
}

output "tenant_id" {
  value = data.azurerm_subscription.current.tenant_id
}
