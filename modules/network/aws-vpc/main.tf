resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block}"

  tags {
    Name        = "${var.environment}-vpc"
    Type        = "VPC"
    Environment = "${var.environment}"
    Monitored   = "${var.monitored}"
  }
}
