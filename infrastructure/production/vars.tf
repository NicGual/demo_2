variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PROJECT_ID" {
  default = "100283722"
}

variable "PROJECT_NAME" {
  default = "Demo-App"
}

variable "PATH_TO_PRIVATE_KEY_1" {
  default = "../keys-machine-1"
}

variable "PATH_TO_PUBLIC_KEY_1" {
  default = "../keys-machine-1.pub"
}
variable "PATH_TO_PRIVATE_KEY_2" {
  default = "../keys-machine-2"
}

variable "PATH_TO_PUBLIC_KEY_2" {
  default = "../keys-machine-2.pub"
}

variable "PATH_TO_PRIVATE_KEY_3" {
  default = "../keys-machine-3"
}

variable "PATH_TO_PUBLIC_KEY_3" {
  default = "../keys-machine-3.pub"
}

variable "PATH_TO_PRIVATE_KEY_4" {
  default = "../keys-machine-4"
}

variable "PATH_TO_PUBLIC_KEY_4" {
  default = "../keys-machine-4.pub"
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