provider "aws" {
  region = "us-east-1"
}

module "iam_user" {
  source  = "github.com/acc-tf-training/tf-modules/aws/iam/modules/iam-user"

  name          = "appleuser"
  force_destroy = true

  pgp_key = "keybase:test"

  password_reset_required = false
}
