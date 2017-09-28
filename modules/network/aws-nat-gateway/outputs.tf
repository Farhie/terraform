output "ids" {
  value = ["${aws_nat_gateway.aws_gateway.id}"]
}

output "az_to_nat_gateway_ids" {
  value = "${zipmap(var.availability_zones, aws_nat_gateway.aws_gateway.id)}"
}
