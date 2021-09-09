environment                      = "dev"
project_name                     = "demo"
bu_name                          = "it"
region                           = "us-east-1"
account_id                       = "366142015340"
vpc_cidr_range                   = "10.0.0.0/16"
vpc_azs_list                     = ["use1-az1", "use1-az2", "use1-az3"]
vpc_private_subnets_list         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
vpc_public_subnets_list          = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
eks_instance_type                = "t2.micro"
eks_asg_max_size                 = 3
