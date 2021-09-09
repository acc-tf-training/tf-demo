provider "aws" {
     region = var.region
}


module "vpc" {
  source = "github.com/acc-tf-training/tf-modules/aws/vpc"

  name = "${var.bu_name}${var.cloud_code}${var.project_name}${var.vpc_cc}${var.environment}01"
  cidr = var.vpc_cidr_range

  azs             = var.vpc_azs_list
  private_subnets = [var.vpc_private_subnets_list[0],var.vpc_private_subnets_list[1],var.vpc_private_subnets_list[2]]
  public_subnets  = [var.vpc_public_subnets_list[0],var.vpc_public_subnets_list[1],var.vpc_public_subnets_list[2]]

  enable_nat_gateway = var.vpc_enable_nat_gateway
  enable_vpn_gateway = var.vpc_enable_vpn_gateway

  tags = {
    Terraform = "true"
    Environment = "${var.environment}"
  }
}
