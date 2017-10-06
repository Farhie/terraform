variable "environment" {}

variable "availability_zones" {
  type = "list"
}

variable "private_subnet_ids" {
  type = "list"
}

variable "application_name" {}

variable "application_launch_config_name" {}

variable "public_load_balancer_name" {}
