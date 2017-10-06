resource "aws_network_acl_rule" "vpc_internal_traffic" {
  network_acl_id = "${aws_network_acl.private_network_acl.id}"

  protocol    = -1
  rule_number = 100
  rule_action = "allow"
  cidr_block  = "${var.vpc_cidr}"
}

resource "aws_network_acl_rule" "non_root_port_tcp" {
  network_acl_id = "${aws_network_acl.private_network_acl.id}"

  protocol    = "tcp"
  rule_number = 140
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 1024
  to_port     = 65535
}

resource "aws_network_acl_rule" "all_non_root_port_traffic" {
  network_acl_id = "${aws_network_acl.private_network_acl.id}"

  protocol    = -1
  rule_number = 200
  rule_action = "allow"
  cidr_block  = "10.0.0.0/8"
}

resource "aws_network_acl_rule" "private_subnet_traffic" {
  count = "${length(var.private_subnet_cidrs)}"

  network_acl_id = "${aws_network_acl.private_network_acl.id}"
  protocol       = -1
  rule_number    = "${500 + (count.index * 10)}"
  rule_action    = "allow"
  cidr_block     = "${element(var.private_subnet_cidrs, count.index)}"
}
