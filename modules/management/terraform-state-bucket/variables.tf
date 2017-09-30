variable "region" {}

variable "terraform_state_bucket" {}

variable "environment" {}

variable "acl" {
  default = "private"
}

variable "monitoring" {
  default = false
}
