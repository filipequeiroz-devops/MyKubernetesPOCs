terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  #Configuring backend
  backend "s3" {
    bucket = "kubernetes-bucket-filipe" #Bucket's name from s3.tf file
    key    = "My-Kubernetes-Cluster/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}