resource "aws_key_pair" "pk-ec2-1" {
  key_name   = "pk-ec2-1"
  public_key = file(var.PATH_TO_PUBLIC_KEY_1)
}
resource "aws_key_pair" "pk-ec2-2" {
  key_name   = "pk-ec2-2"
  public_key = file(var.PATH_TO_PUBLIC_KEY_2)
}
resource "aws_key_pair" "pk-ec2-3" {
  key_name   = "pk-ec2-3"
  public_key = file(var.PATH_TO_PUBLIC_KEY_3)
}
resource "aws_key_pair" "pk-ec2-4" {
  key_name   = "pk-ec2-4"
  public_key = file(var.PATH_TO_PUBLIC_KEY_4)
}