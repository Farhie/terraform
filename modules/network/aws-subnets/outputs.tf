output "ids" {
  value = "${aws_subnet.subnet.*.id}"
}

output "count" {
  value = "${length(var.availability_zones)}"
}
