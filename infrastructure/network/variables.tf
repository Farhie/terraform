variable "region" {}

variable "environment" {}

variable "vpc_cidr" {}

variable "availability_zones" {
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "map"
}

variable "private_subnet_cidrs" {
  type = "map"
}

variable "nginx_instance_type" {}