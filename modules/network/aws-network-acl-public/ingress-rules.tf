resource "aws_network_acl_rule" "http_ingress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 100
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
}

resource "aws_network_acl_rule" "https_ingress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 110
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 433
  to_port     = 433
}

resource "aws_network_acl_rule" "non_root_ports_ingress" {
  network_acl_id = "${aws_network_acl.public_network_acl.id}"

  protocol    = "tcp"
  rule_number = 200
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 1024
  to_port     = 65535
}
