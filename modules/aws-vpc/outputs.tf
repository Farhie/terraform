output "id" {
  value = "${aws_vpc.mod_vpc.id}"
}

output "cidr" {
  value = "${aws_vpc.mod_vpc.cidr_block}"
}
