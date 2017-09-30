resource "aws_route_table" "public_route_table" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.internet_gateway_id}"
  }

  tags {
    Name        = "${var.environment}-public-route-table"
    Type        = "VPC Route Table"
    Environment = "${var.environment}"
  }
}
