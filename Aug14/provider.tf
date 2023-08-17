terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "reddy123"
    key            = "terraform/reddy"
    region         = "ap-south-1"
    dynamodb_table = "123table"
  }

}

provider "aws" {
  region = "ap-south-1"
}
