resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-internet-gateway-${var.region}"
    Type        = "VPC Internet Gateway"
    Region      = "${var.region}"
    Environment = "${var.environment}"
  }
}
