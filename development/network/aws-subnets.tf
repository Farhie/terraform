module "public_subnets" {
  source = "../../modules/network/aws-subnets"

  vpc_id             = "${module.vpc.id}"
  subnet_type        = "public"
  environment        = "${var.environment}"
  cidr_block_map     = "${var.public_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
  region             = "${var.region}"
}

module "private_subnets" {
  source = "../../modules/network/aws-subnets"

  vpc_id             = "${module.vpc.id}"
  subnet_type        = "private"
  environment        = "${var.environment}"
  cidr_block_map     = "${var.private_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
  region             = "${var.region}"
}
