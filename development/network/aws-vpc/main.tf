module "vpc" {
  source = "../../../modules/network/aws-vpc"

  environment = "development"
  cidr = "10.1.0.0/20"
}