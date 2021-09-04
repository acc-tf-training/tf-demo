locals {
  tags = merge(
    {
      "owner"           = var.owner
      "cost_center"     = var.cost_center
      "application"     = var.application
      "environment"     = var.environment
    },
    var.tags
  )
}