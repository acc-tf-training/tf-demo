variable "scope" {
  description = "Scope of the Role"
  type        = string
}

variable "role_definition_name" {
  description = "Role Name that needs to be assgined"
  type        =  string
}

variable "principal_id" {
  description = "principal Id of the service principal"
  type        =  string
}