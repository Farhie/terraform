module "vpc" {
  source = "../../modules/aws-vpc"

  environment = "development"
  cidr = "0.0.0.0/0"
}