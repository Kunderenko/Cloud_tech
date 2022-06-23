provider "aws" {
  region = "us-east-1c"
  
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-lock-lab_aws-bucket"
    key            = "lab_aws/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}