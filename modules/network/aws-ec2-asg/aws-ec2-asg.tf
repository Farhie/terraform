resource "aws_autoscaling_group" "application_auto_scale_group" {
  name                 = "${var.environment}-${var.application_name}-asg"
  max_size             = "${length(var.private_subnet_ids)}"
  min_size             = "${length(var.private_subnet_ids)}"
  desired_capacity     = "${length(var.private_subnet_ids)}"
  launch_configuration = "${var.application_launch_config_name}"
  load_balancers       = ["${var.public_load_balancer_name}"]
  vpc_zone_identifier  = ["${var.private_subnet_ids}"]
  force_delete         = true
  health_check_type    = "ELB"

  tag {
    key                 = "Name"
    value               = "${var.environment}-${var.application_name}-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Type"
    value               = "EC2 Instance"
    propagate_at_launch = true
  }
}
