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

 connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
    }

provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start",
      "sudo rm /usr/share/nginx/html/index.html",
      "echo '<html><head><title>Blue Team Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Blue Team</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html"
    ]
  }
}