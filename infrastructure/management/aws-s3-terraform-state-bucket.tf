module "terraform_state_storage" {
  source = "../../modules/storage/aws-s3"

  bucket_name = "${var.terraform_state_bucket}"
  region      = "${var.region}"
  environment = "${var.environment}"
  acl         = "private"
  versioning  = false
}
