resource "aws_instance" "machine-1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-vpc.id

  # the security group
  vpc_security_group_ids = [aws_security_group.demo-2-application.id]

  # the public SSH key
  key_name = aws_key_pair.pk-ec2-1.key_name

  # provisioner "file" {
  #   source      = "script.sh"
  #   destination = "/tmp/script.sh"
  # }
  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/script.sh",
  #     "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
  #     "sudo /tmp/script.sh",
  #   ]
  # }
  # connection {
  #   host        = coalesce(self.public_ip, self.private_ip)
  #   type        = "ssh"
  #   user        = var.INSTANCE_USERNAME_1
  #   private_key = file(var.PATH_TO_PRIVATE_KEY_1)
  # }
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

#   provisioner "file" {
#     source      = "script.sh"
#     destination = "/tmp/script.sh"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/script.sh",
#       "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
#       "sudo /tmp/script.sh",
#     ]
#   }
  # connection {
  #   host        = coalesce(self.public_ip, self.private_ip)
  #   type        = "ssh"
  #   user        = var.INSTANCE_USERNAME_2
  #   private_key = file(var.PATH_TO_PRIVATE_KEY_2)
  # }
}