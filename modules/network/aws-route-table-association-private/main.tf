resource "aws_route_table_association" "route_table_association" {
  count = "${var.private_subnet_count}"
  subnet_id      = "${element(var.private_subnet_ids, count.index)}"
  route_table_id = "${element(var.route_table_ids, count.index)}"
}
