resource "aws_key_pair" "dev-pk-ec2-1" {
  key_name   = "dev-pk-ec2-1"
  public_key = file(var.PATH_TO_PUBLIC_KEY_1)
}
resource "aws_key_pair" "dev-pk-ec2-2" {
  key_name   = "dev-pk-ec2-2"
  public_key = file(var.PATH_TO_PUBLIC_KEY_2)
}