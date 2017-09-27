variable "region" {}

variable "environment" {}

variable "vpc_cidr" {}

variable "terraform_state_bucket" {}

variable "availability_zones" {
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "map"
}

variable "private_subnet_cidrs" {
  type = "map"
}
