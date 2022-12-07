terraform {
    backend "s3" {
      bucket    = "dev-branch-state-100283722"
      key       = "dev-infra-state/demo/terraform.tfstate"
      region    = "us-east-1"
      encrypt   = true
    }
    
}

resource "aws_s3_bucket" "dev-infra-state" {

    bucket = "dev-branch-state-100283722"

    lifecycle {
        prevent_destroy = false 
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