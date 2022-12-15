terraform {
    backend "s3" {
      bucket    = "demo-state-100283722"
      key       = "application-state/demo/terraform.tfstate"
      region    = "us-east-1"
      encrypt   = true
    }
    
}

resource "aws_s3_bucket" "application-state" {

    bucket = "demo-state-${var.PROJECT_ID}"

    lifecycle {
        prevent_destroy = true 
    }
}

resource "aws_s3_bucket_versioning" "versioning-conf-production" {
  bucket = aws_s3_bucket.application-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse-conf-production" {
  bucket = aws_s3_bucket.application-state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}