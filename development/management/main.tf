provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = "0.10.6"

  backend "s3" {
    bucket = "nordstrom-oms-development-state-storage"
    key    = "management/terraform.tfstate"
    region = "us-west-2"
  }
}
