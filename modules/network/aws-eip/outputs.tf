output "allocation_ids" {
  value = ["${aws_eip.nat_eip.allocation_id}"]
}
