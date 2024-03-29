provider "aws" {
  region = "us-east-1"
}



module "ec2_instance" {
  source  = "../../../../../modules/aws/ec2"

  name = "single-instance"

  ami                    = "ami-01f20c53ed8da4679"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-b6823eaa"]
  subnet_id              = "subnet-8d43adc1"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
