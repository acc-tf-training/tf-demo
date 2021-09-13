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

variable "rds_cc" {
  description = "Cloud Code for RDS"
  type        = string
  default     =  "rds"
}

variable "ec2_cc" {
  description = "Cloud Code for ec2"
  type        = string
  default     =  "ec2"
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


#######################################################
#          VPC                                        #
#######################################################


variable "ec2_instance_type" { 
  description = "Type of ec2 instance"
  type        = string
  default     = ""
}



variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-alb"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

#######################################################
#          ALB Module Modules                         #
#######################################################

