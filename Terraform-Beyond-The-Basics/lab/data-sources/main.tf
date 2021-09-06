provider "aws" {
	region = "us-east-1"
}

 resource "aws_instance" "web" {
 	ami           = data.aws_ami.ubuntu.id
 	instance_type = "t2.micro"
 }

data "aws_ami" "ubuntu" {
	most_recent = true
  #owners      = ["self"]
  owners      = ["311949498761"]

	filter {
		name = "name"
		values = ["aai_ubuntu_c2"]
	}
}



data "aws_vpc" "main" {
	filter {
		name  = "tag:Name"
		values = ["first-vpc"]
	}
}

output "vpc" {
	value = data.aws_vpc.main
}
