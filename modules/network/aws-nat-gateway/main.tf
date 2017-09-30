resource "aws_nat_gateway" "aws_gateway" {
  count         = "${length(var.availability_zones)}"
  allocation_id = "${element(var.allocation_ids, count.index)}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"

  tags {
    Name        = "${var.environment}-nat-gateway-${element(var.availability_zones, count.index)}"
    Type        = "VPC Nat Gateway"
    Region      = "${var.region}"
    Environment = "${var.environment}"
  }
}
