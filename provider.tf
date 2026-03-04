terraform {
  backend "s3" {
    bucket = "suhaan-s3-state001"
    use_lockfile = true
    key = "global/mystatefile/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
}