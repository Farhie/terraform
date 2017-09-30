output "ids" {
  value = "${aws_route_table.private_route_table.*.id}"
}
