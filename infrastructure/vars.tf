variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY_1" {
  default = "keys-machine-1"
}

variable "PATH_TO_PUBLIC_KEY_1" {
  default = "keys-machine-1.pub"
}
variable "PATH_TO_PRIVATE_KEY_2" {
  default = "keys-machine-2"
}

variable "PATH_TO_PUBLIC_KEY_2" {
  default = "keys-machine-2.pub"
}
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1    = "ami-01d08089481510ba2"
    ca-central-1 = "ami-0ab6f6340b2a4fb77"
  }
}

variable "DEFAULT_USERNAME" {
  default = "ubuntu"
}