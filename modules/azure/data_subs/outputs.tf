output "subscription_id" {
  value = data.azurerm_subscriptions.available.subscriptions[0].subscription_id
}

output "tenant_id" {
  value = data.azurerm_subscriptions.available.subscriptions[0].tenant_id
}