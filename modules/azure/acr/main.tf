locals {
  roles_map = { for role in var.roles : "${role.object_id}.${role.role}" => role }
}

resource "azurerm_container_registry" "acr" {
  name                     = format(lower(replace(var.name, "/[[:^alnum:]]/", "")))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  georeplication_locations = var.georeplication_locations

#  network_rule_set = [{
#    default_action = var.network_rs_default_action,
#    virtual_network = [
#      for allowed_subnet_id in var.allowed_subnet_ids : {
#        action    = "Allow"
#        subnet_id = allowed_subnet_id
#    }],
#    ip_rule = [
#      for allow_ip_range in var.allow_ip_ranges : {
#        action   = "Allow"
#        ip_range = allow_ip_range
#    }]
#  }]

  tags = var.tags
}

resource "null_resource" "trust" {
  count = ! var.content_trust ? 0 : 1

  triggers = {
    content_trust = var.content_trust
  }

  # TODO Use new resource when exists
  provisioner "local-exec" {
    command = "az acr config content-trust update --registry ${azurerm_container_registry.acr.name} --status ${var.content_trust ? "enabled" : "disabled"} --subscription ${var.subscription_id}"
  }

  depends_on = [azurerm_container_registry.acr]
}

resource "null_resource" "retention" {
  count = ! var.retention ? 0 : 1

  triggers = {
    retention        = var.retention
    retention_period = var.retention_period
  }

  # TODO Use new resource when exists
  provisioner "local-exec" {
    command = "az acr config retention  update --registry ${azurerm_container_registry.acr.name} --status ${var.retention ? "enabled" : "disabled"}  --days ${var.retention_period} --type UntaggedManifests --subscription ${var.subscription_id}"
  }

  depends_on = [azurerm_container_registry.acr]
}

resource "azurerm_role_assignment" "roles" {
  for_each = local.roles_map

  scope                = azurerm_container_registry.acr.id
  role_definition_name = each.value.role
  principal_id         = each.value.object_id
}
