provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/Users/afahie/.aws/credentials"
  profile                 = "saml"
}

terraform {
  required_version = "0.10.6"

  //  backend "s3" {
  //    bucket = "nordstrom-oms-development-state-storage"
  //    key    = "management/terraform.tfstate"
  //    region = "us-west-2"
  //  }
}
