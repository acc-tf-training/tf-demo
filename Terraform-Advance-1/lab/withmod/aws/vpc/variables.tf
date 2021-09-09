#######################################################
#          Common Project Code                        #
#######################################################


variable "bu_name" {
  description = "Name of the BU"
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

variable "region" {
  description = "AWS Region the Cloud Service will be Hosted"
  type        = string
}

#######################################################
#          Comman Cloud Code                          #
#######################################################

variable "cloud_code" {
  description = "Cloud Code for AWS"
  type        = string
  default     = "aws"
}


variable "vpc_cc" {
  description = "Cloud Code for VPC"
  type        = string
  default     = "vpc"
}



#######################################################
#          VPC                                        #
#######################################################

variable "vpc_cidr_range" {
  description = "VPC CIDR Range"
  type        = string
  default     =  null
}


variable "vpc_enable_nat_gateway" {
  description = "Enable the Nat Gateway"
  type        = bool
  default    =  true
}

variable "vpc_enable_vpn_gateway" {
  description = "Enable the VPN Gateway"
  type        = bool
  default    =  false
}

variable "vpc_azs_list" {
  description = "List of AWS AZ"
  type        = list
  default     = []
}

variable "vpc_private_subnets_list" {
  description = "List of private Subnet"
  type        = list
  default     = []
}


variable "vpc_public_subnets_list" {
  description = "List of public Subnet"
  type        = list
  default     = []
}
