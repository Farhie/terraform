variable "vpc_id" {}

variable "region" {}

variable "environment" {}

variable "private_subnet_ids" {
  type = "list"
}

variable "private_subnet_cidrs" {
  type = "list"
}

variable "vpc_cidr" {}
