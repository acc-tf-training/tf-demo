#######################################################
#          Common Project Code                        #
#######################################################


variable "bu_name" {
  description = "Name of the BU"
  type        = string
}

variable "cloud_code" {
  description = "Name of Cloud Code"
  type        = string
}

variable "project_name" {
  description = "Name of the Project"
  type        = string
}


variable "environment" {
  description = "Name of the enviorment"
  type        = string
}

#######################################################
#          Resource Group  Details                    #
#######################################################




variable "pri_location" {
  description = "Resource Group Location"
  type        = string
}





#######################################################
#          Commmon Cloud Service Code                 #
#######################################################


variable "csc_rsg" {
  description = "Cloud Service Code for ResourceGroup"
  type        = string
  default     = "rsg"
}

variable "csc_noh" {
  description = "Cloud Service Code for Notification hub"
  type        = string
  default     = "noh"
}
