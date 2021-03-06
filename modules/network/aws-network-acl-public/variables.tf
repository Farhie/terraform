variable "vpc_id" {}

variable "region" {}

variable "environment" {}

variable "public_subnet_ids" {
  type = "list"
}

variable "monitoring" {
  default = false
}
