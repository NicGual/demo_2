resource "aws_instance" "machine-1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-vpc.id

  # the security group
  vpc_security_group_ids = [aws_security_group.demo-2-application.id]

  # the public SSH key
  key_name = aws_key_pair.pk-ec2-1.key_name

  private_ip = "10.0.1.7"

  tags = {
    Name = "prod-build-machine-1"
  }
  provisioner "file" {
    source      = "../../config/docker-install.sh"
    destination = "/tmp/docker-install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/docker-install.sh",
      "sudo sed -i -e 's/\r$//' /tmp/docker-install.sh",  # Remove the spurious CR characters.
      "sudo /tmp/docker-install.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.DEFAULT_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY_1)
  }

  
}

resource "aws_instance" "machine-2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-vpc.id

  # the security group
  vpc_security_group_ids = [aws_security_group.demo-2-application.id]

  # the public SSH key
  key_name = aws_key_pair.pk-ec2-2.key_name

  private_ip = "10.0.1.8"

  tags = {
    Name = "prod-deploy-machine-2"
  }

  provisioner "file" {
    source      = "../../config/docker-install.sh"
    destination = "/tmp/docker-install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/docker-install.sh",
      "sudo sed -i -e 's/\r$//' /tmp/docker-install.sh",  # Remove the spurious CR characters.
      "sudo /tmp/docker-install.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.DEFAULT_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY_2)
  }

}

resource "aws_instance" "machine-3" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-vpc-2.id

  # the security group
  vpc_security_group_ids = [aws_security_group.demo-2-application.id]

  # the public SSH key
  key_name = aws_key_pair.pk-ec2-3.key_name

  private_ip = "10.0.2.9"

  tags = {
    Name = "prod-deploy-machine-3"
  }
  provisioner "file" {
    source      = "../../config/docker-install.sh"
    destination = "/tmp/docker-install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/docker-install.sh",
      "sudo sed -i -e 's/\r$//' /tmp/docker-install.sh",  # Remove the spurious CR characters.
      "sudo /tmp/docker-install.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.DEFAULT_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY_3)
  }

  
}

# resource "aws_instance" "machine-4" {
#   ami           = var.AMIS[var.AWS_REGION]
#   instance_type = "t2.micro"

#   # the VPC subnet
#   subnet_id = aws_subnet.main-public-vpc-2.id

#   # the security group
#   vpc_security_group_ids = [aws_security_group.demo-2-application.id]

#   # the public SSH key
#   key_name = aws_key_pair.pk-ec2-4.key_name

#   private_ip = "10.0.2.10"

#   tags = {
#     Name = "machine-4"
#   }
#   provisioner "file" {
#     source      = "../../config/docker-install.sh"
#     destination = "/tmp/docker-install.sh"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/docker-install.sh",
#       "sudo sed -i -e 's/\r$//' /tmp/docker-install.sh",  # Remove the spurious CR characters.
#       "sudo /tmp/docker-install.sh",
#     ]
#   }

#   connection {
#     host        = coalesce(self.public_ip, self.private_ip)
#     type        = "ssh"
#     user        = var.DEFAULT_USERNAME
#     private_key = file(var.PATH_TO_PRIVATE_KEY_4)
#   }

  
# }