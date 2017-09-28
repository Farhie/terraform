module "aws_public_route_table" {
  source              = "../../modules/network/aws-public-route-table"
  vpc_cidr            = "${var.vpc_cidr}"
  internet_gateway_id = "${module.internet_gateway.id}"
  vpc_id              = "${module.vpc.id}"
  environment         = "${var.environment}"
}

module "aws_private_route_table" {
  source                = "../../modules/network/aws-private-route-table"
  vpc_cidr              = "${var.vpc_cidr}"
  availability_zones    = "${var.availability_zones}"
  az_to_nat_gateway_ids = "${module.nat_gateway.az_to_nat_gateway_ids}"
  vpc_id                = "${module.vpc.id}"
  environment           = "${var.environment}"
}

module "aws_public_subnet_route_table_association" {
  source         = "../../modules/network/aws-route-table-association"
  route_table_id = "${module.aws_public_route_table.id}"
  subnet_count   = "${module.public_subnets.count}"
  subnet_ids     = "${module.public_subnets.ids}"
}
