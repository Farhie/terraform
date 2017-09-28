resource "aws_route_table" "public-route-table" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-public-route-table"
    Type        = "VPC Route Table"
    Environment = "${var.environment}"
  }
}

resource "aws_route" "all-traffic-to-internet-gateway" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  cidr_block     = "0.0.0.0/0"
  gateway_id     = "${var.internet_gateway_id}"
}
