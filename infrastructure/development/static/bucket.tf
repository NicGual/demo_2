resource "aws_s3_bucket" "dev-infra-state" {

    bucket = "dev-branch-state-100283722"

    lifecycle {
        prevent_destroy = false 
    }
}

resource "aws_s3_bucket_versioning" "versioning-conf" {
  bucket = aws_s3_bucket.dev-infra-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse-conf" {
  bucket = aws_s3_bucket.dev-infra-state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}