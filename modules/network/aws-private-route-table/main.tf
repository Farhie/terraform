resource "aws_route_table" "private_route_table" {
  count  = "${length(var.availability_zones)}"
  vpc_id = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-private-route-table-${element(var.availability_zones, count.index)}"
    Type        = "VPC Route Table"
    Environment = "${var.environment}"
  }
}

resource "aws_route" "egress_private_subnet_to_internet" {
  count  = "${length(var.availability_zones)}"

  route_table_id = "${element(aws_route_table.private_route_table.*.id, count.index)}"
  destination_cidr_block     = "0.0.0.0/0"
  nat_gateway_id = "${lookup(var.az_to_nat_gateway_ids, element(var.availability_zones, count.index))}"
}