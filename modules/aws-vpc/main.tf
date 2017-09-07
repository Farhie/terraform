resource "aws_vpc" "mod_vpc" {
  cidr_block = "${var.cidr}"
  tags {
    Name = "${var.environment}-vpc"
    Type = "VPC"
    Environment = "${var.environment}"
    Monitoring = "true"
  }
}