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

    versioning {
        enabled = true 
    }

    server_side_encryption_configuration {

        rule {
            apply_server_side_encryption_by_default {

                sse_algorithm = "AES256"
            }
        }
    }

}