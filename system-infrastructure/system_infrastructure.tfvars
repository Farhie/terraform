terraform {
  required_version = "0.10.4"
}

variable "environment" {
  description = "environment name"
  default = "TEMPLATE"
}

variable "vpc_cidr" {
  description = "vpc cidr block"
  default = ""
}