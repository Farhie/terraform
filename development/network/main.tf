provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = "0.10.6"

  backend "s3" {
    bucket  = "farhie-development-state-storage"
    key     = "network/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}
