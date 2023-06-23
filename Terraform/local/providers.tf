provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "tc-deployment-terraform-jenkins"
    key            = "backup-test-local"
    region         = "us-east-1"
    dynamodb_table = "tc-terraform-jenkins"

  }
}

