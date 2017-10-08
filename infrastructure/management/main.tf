provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "beach"
}

terraform {
  required_version = "0.10.6"

  backend "s3" {}
}
