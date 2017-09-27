resource "aws_nat_gateway" "aws_gateway" {
  count = "${length(var.availability_zones)}"
  allocation_id = "${var.allocation_id}"
  subnet_id = "${element(var.availability_zones, count.index)}"
}