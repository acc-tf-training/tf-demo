variable "location" {
  description = "Azure location where to place resources"
  type        = string
}

variable "name" {
  description = "Name of the resource"
  type        = string
}

variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
}


variable "sku" {
  description = "The SKU name of the container registry"
  type        = string
  default     = "Standard"
}

variable "content_trust" {
  description = "Set to true to enable Docker Content Trust on registry."
  type        = bool
  default     = false
}

variable "georeplication_locations" {
  description = "A list of Azure locations where the container registry should be geo-replicated."
  type        = list(string)
  default     = null
}

variable "roles" {
  description = "List of roles that should be assigned to Azure AD object_ids."
  type        = list(object({ object_id = string, role = string }))
  default     = []
}


variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}


variable "admin_enabled" {
  description = "Enable Admin account of  ACR"
  type        = string
  default     = false
}



variable "subscription_id" {
  description = "Subscription ID which the Azure resource will be deployed"
  type        = string
  default     = null
}


variable "allowed_subnet_ids" {
  description = "Subnet ID to be allowed access to container registry"
  type        = list
  default     = []
}

variable "allow_ip_ranges" {
  description = "List of Allowed IP Range"
  type        = list
  default     = []
}

variable "retention" {
  description = "Retention Status of ACR"
  type        = bool
  default     = false
}


variable "retention_period" {
  description = "Retention Period of ACR"
  type        = string
  default     = null
}



variable "network_rs_default_action" {
  description = "Default Network RuleSet"
  type        = string
  default     = "Deny"
}
