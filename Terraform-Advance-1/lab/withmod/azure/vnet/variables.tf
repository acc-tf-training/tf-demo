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


variable "csc_sub" {
  description = "Cloud Service Code for Subscription"
  type        = string
  default     = "sub"
}

variable "csc_rsg" {
  description = "Cloud Service Code for ResourceGroup"
  type        = string
  default     = "rsg"
}



variable "csc_vnt" {
  description = "Cloud Service Code for Azure Virtual network"
  type        = string
  default     = "vnt"
}



#######################################################
#         Network Details                             #
#######################################################



variable "vnt_address_space" {
  description = "Address Space of Virtual Network"
  type        = list
}

variable "vnt_snt_address_spaces" {
  description = "List of Address Space of Subnet"
  type        = list
}

variable "subnet_names" {
  description = "List of Subnet Name"
  type        = list
}


#######################################################
#         Network Security Group                      #
#######################################################


variable "nsg_name" {
  description = "Name of the Security Group"
  type        = list
}
