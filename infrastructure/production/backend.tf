terraform {
    backend "s3" {
      bucket    = "demo-state-100283722"
      key       = "application-state/demo/terraform.tfstate"
      region    = "us-east-1"
      encrypt   = true
    }
    
}