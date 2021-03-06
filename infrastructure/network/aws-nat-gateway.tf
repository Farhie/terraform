module "nat_gateway_eips" {
  source             = "../../modules/network/aws-eip"
  availability_zones = "${var.availability_zones}"
}

module "nat_gateway" {
  source = "../../modules/network/aws-nat-gateway"

  allocation_ids     = "${module.nat_gateway_eips.ids}"
  subnet_ids         = "${module.public_subnets.ids}"
  availability_zones = "${var.availability_zones}"
  environment        = "${var.environment}"
  region             = "${var.region}"
}
