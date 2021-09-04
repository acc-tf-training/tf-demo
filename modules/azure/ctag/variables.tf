variable "owner" {
  description = "owner of the environment"
  type        = string
}

variable "cost_center" {
  description = "cost_center of the environment"
  type        = string
}

variable "application" {
  description = "application running in the environment"
  type        = string
}

variable "environment" {
  description = "name of the environment"
  type        = string
}


variable "tags" {
  description = "Common Tag for the environment"
  type        = map
  default     = {}
}