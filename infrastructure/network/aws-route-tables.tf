module "aws_public_route_table" {
  source              = "../../modules/network/aws-public-route-table"
  vpc_cidr            = "${var.vpc_cidr}"
  internet_gateway_id = "${module.internet_gateway.id}"
  vpc_id              = "${module.vpc.id}"
  environment         = "${var.environment}"
  region              = "${var.region}"
}

module "aws_private_route_table" {
  source                = "../../modules/network/aws-private-route-table"
  vpc_cidr              = "${var.vpc_cidr}"
  availability_zones    = "${var.availability_zones}"
  az_to_nat_gateway_ids = "${module.nat_gateway.az_to_nat_gateway_ids}"
  vpc_id                = "${module.vpc.id}"
  environment           = "${var.environment}"
}

resource "aws_route_table_association" "public_route_table_association" {
  count = "${module.public_subnets.count}"

  subnet_id      = "${element(module.public_subnets.ids, count.index)}"
  route_table_id = "${module.aws_public_route_table.id}"
}

resource "aws_route_table_association" "private_route_table_association" {
  count = "${module.private_subnets.count}"

  subnet_id      = "${element(module.private_subnets.ids, count.index)}"
  route_table_id = "${element(module.aws_private_route_table.ids, count.index)}"
}
