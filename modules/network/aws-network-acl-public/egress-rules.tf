resource "aws_network_acl_rule" "http-egress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 100
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  egress      = true
}

resource "aws_network_acl_rule" "https-egress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 110
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 433
  to_port     = 433
  egress      = true
}

resource "aws_network_acl_rule" "non-root-ports-egress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 200
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 1024
  to_port     = 65535
  egress      = true
}

resource "aws_network_acl_rule" "deny-all-other-egress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "all"
  rule_number = 999
  rule_action = "deny"
  cidr_block  = "0.0.0.0/0"
  egress      = true
}
