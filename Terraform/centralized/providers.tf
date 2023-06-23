provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "tc-terraform-jenkins"
    key            = "backup-test"
    region         = "us-east-1"
    dynamodb_table = "tc-terraform-jenkins"

  }
}

