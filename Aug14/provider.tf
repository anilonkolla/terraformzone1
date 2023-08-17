terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "reddy123"
    key            = "terraform/aws"
    region         = "ap-south-1"
    dynamodb_table = "mytable"
  }

}

provider "aws" {
  region = "ap-south-1"
}
