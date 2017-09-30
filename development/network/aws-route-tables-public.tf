module "aws_public_route_table" {
  source              = "../../modules/network/aws-public-route-table"
  vpc_cidr            = "${var.vpc_cidr}"
  internet_gateway_id = "${module.internet_gateway.id}"
  vpc_id              = "${module.vpc.id}"
  environment         = "${var.environment}"
}

module "aws_public_subnet_route_table_association" {
  source         = "../../modules/network/aws-route-table-association-public"
  route_table_id = "${module.aws_public_route_table.id}"
  subnet_ids     = "${module.public_subnets.ids}"
}