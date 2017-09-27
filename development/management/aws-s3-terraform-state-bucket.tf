module "terraform_state_storage" {
  source = "../../modules/management/terraform-state-bucket"

  terraform_state_bucket = "${var.terraform_state_bucket}"
  region                 = "${var.region}"
  environment            = "${var.environment}"
}
