terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.34"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9"
    }
  }

  backend "s3" {
    bucket         = "baro-ticket-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}