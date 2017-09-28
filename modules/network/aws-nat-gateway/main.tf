resource "aws_nat_gateway" "aws_gateway" {
  count         = "${length(var.availability_zones)}"
  allocation_id = "${var.allocation_id}"
  subnet_id     = "${element(var.availability_zones, count.index)}"

  tags {
    Name        = "${var.environment}-nat-gateway-${element(var.availability_zones, count.index)}"
    Type        = "VPC Nat Gateway"
    Environment = "${var.environment}"
  }
}
