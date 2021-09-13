module "ec2_instance" {
  source  = "github.com/acc-tf-training/tf-modules/aws/ec2"


  name                   = "${var.bu_name}${var.cloud_code}${var.project_name}${var.ec2_cc}${var.environment}01"

  ami                    = "ami-01f20c53ed8da4679"
  instance_type          = var.ec2_instance_type
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets.0

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}
