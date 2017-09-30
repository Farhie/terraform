module "aws_private_route_table" {
  source                = "../../modules/network/aws-private-route-table"
  vpc_cidr              = "${var.vpc_cidr}"
  availability_zones    = "${var.availability_zones}"
  az_to_nat_gateway_ids = "${module.nat_gateway.az_to_nat_gateway_ids}"
  vpc_id                = "${module.vpc.id}"
  environment           = "${var.environment}"
}

module "aws_private_subnet_route_table_association" {
  source         = "../../modules/network/aws-route-table-association-private"
  route_table_ids = "${module.aws_private_route_table.ids}"
  private_subnet_count   = "${module.private_subnets.count}"
  private_subnet_ids     = "${module.private_subnets.ids}"
}