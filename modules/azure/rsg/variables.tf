variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "name" {
  description = "Resource Group Name"
  type        = string
}


variable "lock_level" {
  description = "Specifies the Level to be used for this RG Lock. Possible values are Empty (no lock), CanNotDelete and ReadOnly."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tag for the resource group"
  type        = map
  default     = {}
}


