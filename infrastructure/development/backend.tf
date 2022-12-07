# terraform {
#     backend "s3" {
#       bucket    = "dev-branch-state-${var.PROJECT_ID}"
#       key       = "dev-infra-state/demo/terraform.tfstate"
#       region    = var.AWS_REGION
#       encrypt   = true
#     }
    
# }

resource "aws_s3_bucket" "dev-infra-state" {

    bucket = "dev-branch-state-100283722"

    lifecycle {
        prevent_destroy = true 
    }

    versioning {
        enabled = true 
    }

    server_uside_encryption_configuration {

        rule {
            apply_server_side_centryption_by_default {

                sse_algorithm = "AES256"
            }
        }
    }

}