#######################################################
#          Common Project Tagging                     #
#######################################################

variable "owner" {
  description = "Dept Owner"
  type        = string
}

variable "cost_center" {
  description = "cost_center of the project"
  type        = string
}

variable "application" {
  description = "Name of the application"
  type        = string
}


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

variable "csc_mysql" {
  description = "Cloud Service Code for Azure Mysql DB"
  type        = string
  default     = "msl"
}

variable "csc_snt" {
  description = "Cloud Service Code for Azure Subnet"
  type        = string
  default     = "snt"
}

variable "csc_nsg" {
  description = "Cloud Service Code for Azure Network Security Group"
  type        = string
  default     = "nsg"
}

variable "csc_kms" {
  description = "Cloud Service Code for Azure Key Vault"
  type        = string
  default     = "kms"
}


variable "csc_agw" {
  description = "Cloud Service Code for Azure application Gateway"
  type        = string
  default     = "agw"
}


variable "csc_pip" {
  description = "Cloud Service Code for Azure Public  IP address"
  type        = string
  default     = "pip"
}


variable "csc_sta" {
  description = "Cloud Service Code for Storage Account"
  type        = string
  default     = "sta"
}

variable "csc_sfs" {
  description = "Cloud Service Code for Storage Account file share"
  type        = string
  default     = "sfs"
}

variable "csc_ada" {
  description = "Cloud Service Code for Azure Application Registration"
  type        = string
  default     = "ada"
}


variable "csc_rtb" {
  description = "Cloud Service Code for Azure Route Table"
  type        = string
  default     = "rtb"
}


variable "csc_afw" {
  description = "Cloud Service Code for Azure Firewall"
  type        = string
  default     = "afw"
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





#######################################################
#         DataBase                                    #
#######################################################




variable "mysql_administrator_login" {
  description = "Mysql Administrator login"
  type        = string
}

variable "mysql_administrator_password" {
  description = "Mysql Administrator Password"
  type        = string
}

variable "mysql_db_tier" {
  description = "Mysql DB Tier"
  type        = string
}

variable "mysql_db_capacity" {
  description = "Mysql DB capacity"
  type        = number
}

variable "mysql_db_storage_size" {
  description = "Mysql DB Storage Size"
  type        = number
}


variable "mysql_db_backup_retention_days" {
  description = "Mysql DB Backup Retention Days"
  type        = number
}


variable "mysql_db_geo_redundant_backup_enabled" {
  description = "Mysql Geo-redundant Backup"
  type        = bool
}

variable "mysql_db_auto_grow_enabled" {
  description = "Mysql DB Auto Grow enablement"
  type        = bool
}



variable "mysql_server_version" {
  description = "Mysql Version"
  type        = string
}

variable "mysql_server_tls_version" {
  description = "Mysql TLS Version"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Flag to enable the public_network_access_enabled"
  type        = bool
  default     = true
}


