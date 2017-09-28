module "aws_public_route_table" {
  source              = "../../modules/network/aws-public-route-table"
  vpc_cidr            = "${var.vpc_cidr}"
  internet_gateway_id = "${module.internet_gateway.id}"
  vpc_id              = "${module.vpc.id}"
  environment         = "${var.environment}"
}
