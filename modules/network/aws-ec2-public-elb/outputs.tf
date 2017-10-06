output "name" {
  value = "${aws_elb.public_load_balancer.name}"
}

output "security_group_id" {
  value = "${aws_security_group.security_group.id}"
}
