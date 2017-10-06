module "aws_network_acl_public" {
  source = "../../modules/network/aws-network-acl-public"

  vpc_id            = "${module.vpc.id}"
  environment       = "${var.environment}"
  public_subnet_ids = "${module.public_subnets.ids}"
  region            = "${var.region}"
}

module "aws_network_acl_private" {
  source = "../../modules/network/aws-network-acl-private"

  vpc_id               = "${module.vpc.id}"
  environment          = "${var.environment}"
  region               = "${var.region}"
  vpc_cidr             = "${var.vpc_cidr}"
  private_subnet_cidrs = "${module.private_subnets.cidrs}"
  private_subnet_ids   = "${module.private_subnets.ids}"
}