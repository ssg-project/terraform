data "aws_ecrpublic_authorization_token" "token" {
  provider = aws.ecr
}

data "aws_availability_zones" "available" {
  # Do not include local zones
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

locals {
  # network
  region   = "ap-northeast-2"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  vpc_cidr = "10.0.0.0/16"

  # eks
  eks_name              = "ticketing-cluster"
  eks_version           = "1.32"
  eks_node_min_size     = 2
  eks_node_max_size     = 3
  eks_node_desired_size = 2

  # karpenter
  karpenter_namespace = "karpenter"

  # tag
  tags = {
    Blueprint = local.eks_name
  }
}