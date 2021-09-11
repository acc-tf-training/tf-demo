##############################################################################
#          Create the Database                                               #
##############################################################################


module "mysql" {
  source  = "github.com/acc-tf-training/tf-modules/azure/mysql"

  name                 = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_mysql}${var.environment}10"
  location             = module.rsg.location
  resource_group_name  = module.rsg.name
  
  tier     = var.mysql_db_tier
  capacity = var.mysql_db_capacity
 
  #  allowed_cidrs = ["0.0.0.0/0"]

  #allowed_subnets = [module.vnt.subnets.0,module.vnt.subnets.1]

  storage_mb                   = var.mysql_db_storage_size
  backup_retention_days        = var.mysql_db_backup_retention_days
  geo_redundant_backup_enabled = var.mysql_db_geo_redundant_backup_enabled
  auto_grow_enabled            = var.mysql_db_auto_grow_enabled

  administrator_login    = var.mysql_administrator_login
  administrator_password = var.mysql_administrator_password
  databases_names        = ["${var.application}_${var.environment}"]           

  force_ssl             = true
  tls_version           = var.mysql_server_tls_version
  mysql_options         = [{name="interactive_timeout", value="28800"}, {name="wait_timeout", value="120"}]
  mysql_version         = var.mysql_server_version
  databases_charset     = {
    "my_database" = "utf8"
  }
  databases_collation   = {
    "${var.application}_${var.environment}"        = "utf8_general_ci"
  }
}
