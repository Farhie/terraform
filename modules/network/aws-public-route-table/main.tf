resource "aws_route_table" "public_route_table" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-public-route-table"
    Type        = "VPC Route Table"
    Environment = "${var.environment}"
  }
}

resource "aws_route" "egress_public_subnet_to_internet" {
  route_table_id = "${aws_route_table.public_route_table.id}"
  destination_cidr_block     = "0.0.0.0/0"
  gateway_id = "${var.internet_gateway_id}"
}