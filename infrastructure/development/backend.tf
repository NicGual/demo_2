terraform {
    backend "s3" {
      bucket    = "dev-branch-state-100283722"
      key       = "dev-infra-state/demo/terraform.tfstate"
      region    = "us-east-1"
      encrypt   = true
    }
    
}