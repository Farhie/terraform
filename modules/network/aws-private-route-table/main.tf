resource "aws_route_table" "private-route-table" {
  count  = "${length(var.availability_zones)}"
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${lookup(var.az_to_nat_gateway_ids, element(var.availability_zones, count.index))}"
  }

  tags {
    Name        = "${var.environment}-private-route-table-${element(var.availability_zones, count.index)}"
    Type        = "VPC Route Table"
    Environment = "${var.environment}"
  }
}
