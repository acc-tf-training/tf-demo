resource "azurerm_resource_group" "rsg" {
  name      = var.name
  location  = var.location
  tags      = var.tags 
}


resource "azurerm_management_lock" "rsg-level-lock" {
  name       = "${var.name}-level-lock"
  scope      = azurerm_resource_group.rsg.id
  lock_level = var.lock_level
  notes      = "Resource Group '${var.name}' is locked with '${var.lock_level}' level."
  count      = var.lock_level == "" ? 0 : 1
}