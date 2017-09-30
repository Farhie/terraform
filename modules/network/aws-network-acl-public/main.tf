resource "aws_network_acl" "public_network_acl" {
  vpc_id     = "${var.vpc_id}"
  subnet_ids = ["${var.public_subnet_ids}"]

  tags {
    Name        = "${var.environment}-public-network-acl-${var.region}"
    Type        = "VPC Route Table"
    Region      = "${var.region}"
    Environment = "${var.environment}"
    Monitoring  = "${var.monitoring}"
  }
}
