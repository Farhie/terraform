module "internet_gateway" {
  source      = "../../modules/network/aws-internet-gateway"
  environment = "${var.environment}"
  vpc_id      = "${module.vpc.id}"
  region      = "${var.region}"
}
