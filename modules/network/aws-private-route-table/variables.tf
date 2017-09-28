variable "vpc_id" {}

variable "vpc_cidr" {}

variable "environment" {}

variable "az_to_nat_gateway_ids" {
  type = "map"
}

variable "availability_zones" {
  type="list"
}