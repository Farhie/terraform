module "vpc" {
  source = "../../modules/network/aws-vpc"

  environment = "${var.environment}"
  cidr_block  = "${var.vpc_cidr}"
  region      = "${var.region}"
}
