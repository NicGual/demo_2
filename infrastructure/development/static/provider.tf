provider "aws" {
  region = var.AWS_REGION
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]

}