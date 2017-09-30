resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-internet-gateway"
    Type        = "VPC Internet Gateway"
    Environment = "${var.environment}"
  }
}
