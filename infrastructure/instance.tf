resource "aws_instance" "machine-1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-vpc.id

  # the security group
  vpc_security_group_ids = [aws_security_group.demo-2-application.id]

  # the public SSH key
  key_name = aws_key_pair.pk-ec2-1.key_name

  
}

resource "aws_instance" "machine-2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-private-subnet.id

  # the security group
  vpc_security_group_ids = [aws_security_group.demo-2-application.id]

  # the public SSH key
  key_name = aws_key_pair.pk-ec2-2.key_name

}