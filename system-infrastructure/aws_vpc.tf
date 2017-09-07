module "vpc" {
  source = "../modules/aws-vpc"

  name = "${var.environment}-vpc"
  environment = "${var.environment}"
  cidr = "${var.vpc_cidr}"
}