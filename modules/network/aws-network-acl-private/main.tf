resource "aws_network_acl" "private_network_acl" {
  vpc_id     = "${var.vpc_id}"
  subnet_ids = ["${var.private_subnet_ids}"]

  tags {
    Name        = "${var.environment}-private-network-acl-${var.region}"
    Type        = "VPC Route Table"
    Region      = "${var.region}"
    Environment = "${var.environment}"
  }
}
