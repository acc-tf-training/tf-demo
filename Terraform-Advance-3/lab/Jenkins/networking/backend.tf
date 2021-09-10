terraform {
  backend "s3" {
    bucket         =  "FILL_THE_BCUKET_NAME"
    key            = "tf/terraform.tfstate"
    region         = "us-east-1"
  }
}
