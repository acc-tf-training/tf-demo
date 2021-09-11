module "db" {
  source  = "github.com/acc-tf-training/tf-modules/aws/rds"
  identifier = "${var.bu_name}${var.cloud_code}${var.project_name}${var.rds_cc}${var.environment}01"

  engine            = "postgres"
  engine_version    = "11.10"
  instance_class    = "db.t2.small"
  allocated_storage = 5

  name     = "demodb"
  username = "superadmin"
  password = "YourPwdShouldBeLongAndSecure"
  port     = "5432"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.vpc.database_subnet_group]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = [module.vpc.private_subnets.0,module.vpc.private_subnets.1]

  # DB parameter group
    family = "postgres11"

  # Database Deletion Protection
  deletion_protection = false
}
