resource "aws_elb" "public_load_balancer" {
  name                      = "${var.environment}-${var.application_name}-public-elb"
  subnets                   = ["${var.public_subnet_ids}"]
  cross_zone_load_balancing = true
  internal                  = false
  security_groups           = ["${aws_security_group.security_group.id}"]

  listener {
    instance_port     = "${var.application_port}"
    instance_protocol = "http"
    lb_port           = "${var.elb_application_port}"
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags {
    Name        = "${var.environment}-${var.application_name}-public-elb"
    Type        = "ELB"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "security_group" {
  name        = "${var.environment}-${var.application_name}-elb-security-group"
  description = "Ingress to public ELB for ${var.application_name} from public"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-${var.application_name}-public-elb"
    Type        = "EC2 Security Group"
    Environment = "${var.environment}"
    Monitoring  = "true"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
