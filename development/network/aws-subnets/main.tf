data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "${var.terraform_state_bucket}"
    key    = "${var.environment}/network/aws-vpc/terraform.tfstate"
    region = "${var.region}"
  }
}

module "public_subnets" {
  source = "../../../modules/network/aws-subnets"

  vpc_id             = "${data.terraform_remote_state.vpc.vpc_id}"
  subnet_type        = "public"
  environment        = "${var.environment}"
  cidr_block_map     = "${var.public_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
}

module "private_subnets" {
  source = "../../../modules/network/aws-subnets"

  vpc_id             = "${data.terraform_remote_state.vpc.vpc_id}"
  subnet_type        = "private"
  environment        = "${var.environment}"
  cidr_block_map     = "${var.private_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
}
