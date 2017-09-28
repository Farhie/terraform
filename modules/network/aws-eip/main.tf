resource "aws_eip" "nat_eip" {
  count = "${length(var.availability_zones)}"
  vpc   = "true"
}
