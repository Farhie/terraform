resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "${var.acl}"
  region = "${var.region}"

  tags {
    Name        = "${var.bucket_name}"
    Type        = "S3 Bucket"
    Environment = "${var.environment}"
  }

  versioning {
    enabled = "${var.versioning}"
  }
}
