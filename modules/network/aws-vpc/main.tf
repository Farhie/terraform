resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block}"

  tags {
    Name        = "${var.environment}-vpc-${var.region}"
    Type        = "VPC"
    Region      = "${var.region}"
    Environment = "${var.environment}"
    Monitoring  = "${var.monitoring}"
  }
}
