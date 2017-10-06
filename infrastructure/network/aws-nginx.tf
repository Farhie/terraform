module "nginx_public_elb" {
  source = "../../modules/network/aws-ec2-public-elb"

  application_name     = "nginx"
  application_port     = 80
  elb_application_port = 80
  public_subnet_ids    = "${module.public_subnets.ids}"
  environment          = "${var.environment}"
  vpc_id               = "${module.vpc.id}"
}

module "nginx_launch_config" {
  source = "../../modules/network/aws-ec2-launch-config"

  user_data                    = "../../lib/configure-nginx.sh"
  application_name             = "nginx"
  instance_type                = "${var.nginx_instance_type}"
  environment                  = "${var.environment}"
  vpc_id                       = "${module.vpc.id}"
  public_elb_security_group_id = "${module.nginx_public_elb.security_group_id}"
}

module "nginx_asg" {
  source = "../../modules/network/aws-ec2-asg"

  application_name               = "nginx"
  application_launch_config_name = "${module.nginx_launch_config.name}"
  availability_zones             = "${var.availability_zones}"
  private_subnet_ids             = "${module.private_subnets.ids}"
  public_load_balancer_name      = "${module.nginx_public_elb.name}"
  environment                    = "${var.environment}"
}
