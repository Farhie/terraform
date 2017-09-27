module "public_nat_gateway" {
  source = "../../modules/network/aws-nat-gateway"

  allocation_id = "nat-03471ad960801e57e"
  subnet_ids = "${module.public_subnets.subnet_ids}"
  availability_zones = "${var.availability_zones}"
}