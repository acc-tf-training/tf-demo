##################################################################################
# VARIABLES
##################################################################################

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "region" {
  default = "us-east-1"
}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
access_key = var.aws_access_key
secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}