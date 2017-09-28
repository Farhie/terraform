module "aws_network_acl_public" {
  source = "../../modules/network/aws-network-acl-public"

  vpc_id            = "${module.vpc.id}"
  environment       = "${var.environment}"
  public_subnet_ids = "${module.public_subnets.ids}"
  region            = "${var.region}"
}
