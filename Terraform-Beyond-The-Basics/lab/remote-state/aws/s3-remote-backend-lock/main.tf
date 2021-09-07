terraform {
  backend "s3" {
    #bucket = "FILL_THE_BCUKET_NAME"
    key            = "tf/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"

  tags = {
    Name = "My Test EC2"
  }
}
