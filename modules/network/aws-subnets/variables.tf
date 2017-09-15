variable "vpc_id" {}

variable "cidr_block_map" {
  type = map
}

variable "environment" {}

variable "availability_zones" {
  type = list
}

variable "subnet_type" {}