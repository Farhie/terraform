provider "aws" {
  region                  = "us-west-2"
  profile                 = "default"
  shared_credentials_file = "~/.aws/credentials"
}

terraform {
  required_version = "0.10.6"

  backend "s3" {}
}
