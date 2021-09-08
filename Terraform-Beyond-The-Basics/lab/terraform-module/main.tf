provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_cidr_block = var.vpc_cidr_block
}

resource "aws_instance" "my-instance" {
  ami           = data.aws_ssm_parameter.this.value
  subnet_id     = module.vpc.subnet_id
  instance_type = "t3.micro"
}

data "aws_ssm_parameter" "this" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
