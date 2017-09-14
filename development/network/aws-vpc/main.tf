module "vpc" {
  source = "../../../modules/network/aws-vpc"

  environment = "development"
  cidr_block = "10.1.0.0/20"
}