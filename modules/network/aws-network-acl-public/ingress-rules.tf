resource "aws_network_acl_rule" "http-ingress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 100
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
}

resource "aws_network_acl_rule" "https-ingress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 110
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 433
  to_port     = 433
}

resource "aws_network_acl_rule" "non-root-ports-ingress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 200
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 1024
  to_port     = 65535
}

resource "aws_network_acl_rule" "deny-all-other-ingress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "all"
  rule_number = 999
  rule_action = "deny"
  cidr_block  = "0.0.0.0/0"
}
