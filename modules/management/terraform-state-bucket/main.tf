resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "${var.terraform_state_bucket}"
  acl    = "private"
  region = "${var.region}"

  tags {
    Name        = "${var.terraform_state_bucket}"
    Type        = "S3 Bucket"
    Environment = "${var.environment}"
  }

  versioning {
    enabled = false
  }
}
