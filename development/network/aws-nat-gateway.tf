module "nat_gateway_eips" {
  source             = "../../modules/network/aws-eip"
  availability_zones = "${var.availability_zones}"
}

module "public_nat_gateway" {
  source = "../../modules/network/aws-nat-gateway"

  allocation_id      = "${module.nat_gateway_eips.allocation_ids}"
  subnet_ids         = "${module.public_subnets.ids}"
  availability_zones = "${var.availability_zones}"
  environment        = "${var.environment}"
}
