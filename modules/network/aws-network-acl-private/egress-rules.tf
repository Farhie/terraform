resource "aws_network_acl_rule" "http_egress" {
  network_acl_id = "${aws_network_acl.private_network_acl.id}"

  protocol    = -1
  rule_number = 100
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  egress      = true
}
