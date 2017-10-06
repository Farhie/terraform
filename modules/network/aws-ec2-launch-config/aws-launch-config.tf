resource "aws_launch_configuration" "application_launch_config" {
  name_prefix     = "${var.environment}-${var.application_name}-"
  image_id        = "ami-6e1a0117"
  instance_type   = "${var.instance_type}"
  user_data       = "${file(var.user_data)}"
  security_groups = ["${aws_security_group.security_group.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "security_group" {
  name        = "${var.environment}-${var.application_name}-security-group"
  description = "Ingress to ${var.application_name} ELB from public"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-${var.application_name}"
    Type        = "EC2 Security Group"
    Environment = "${var.environment}"
    Monitoring  = "true"
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    security_groups = [
      "${var.public_elb_security_group_id}",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}
