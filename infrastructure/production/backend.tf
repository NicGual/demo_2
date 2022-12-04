# terraform {
#     backend "s3" {
#       bucket    = "demo-state-${var.PROJECT_ID}"
#       key       = "application-state/demo/terraform.tfstate"
#       region    = var.AWS_REGION
#       encrypt   = true
#     }
    
# }

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
            apply_server_side_centryption_by_default {

                sse_algorithm = "AES256"
            }
        }
    }

}