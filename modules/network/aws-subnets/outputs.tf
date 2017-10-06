output "ids" {
  value = "${aws_subnet.subnet.*.id}"
}

output "cidrs" {
  value = "${aws_subnet.subnet.*.cidr_block}"
}

output "count" {
  value = "${length(var.availability_zones)}"
}
