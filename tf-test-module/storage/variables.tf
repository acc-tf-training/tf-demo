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


variable "account_tier" {
  description = "The account_tier of the storage"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The account_replication_type of the storage"
  type        = string
  default     = "GRS"
}


variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "dev"
}
