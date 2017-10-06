variable "environment" {}

variable "public_subnet_ids" {
  type = "list"
}

variable "application_name" {}

variable "application_port" {}

variable "elb_application_port" {}

variable "vpc_id" {}
