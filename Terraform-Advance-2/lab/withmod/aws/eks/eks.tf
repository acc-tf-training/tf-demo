module "eks" {
  source          = "github.com/acc-tf-training/tf-modules/aws/eks"
  cluster_name    = "${var.bu_name}${var.cloud_code}${var.project_name}${var.eks_cc}${var.environment}01"
  cluster_version = var.eks_cluster_version
  subnets         = [module.vpc.public_subnets.0,module.vpc.public_subnets.1]
  vpc_id          = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type = var.eks_instance_type
      asg_max_size  = 4
      asg_min_size  = 1
      asg_desired_capacity = 1
    }
  ]

  node_groups = [
    {
       node_group_name   = "demoapp"
       desired_capacity  = 1
       max_capacity      = 4
       min_capacity      = 1
    }
  ]


}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
