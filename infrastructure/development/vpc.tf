# Internet VPC
resource "aws_vpc" "dev-env-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "dev enviroment vpc"
  }
}
# Public Subnets
resource "aws_subnet" "dev-public-vpc" {
  vpc_id                  = aws_vpc.dev-env-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public-vpc"
  }
}

# Internet GW
resource "aws_internet_gateway" "dev-public-gw" {
  vpc_id = aws_vpc.dev-env-vpc.id

  tags = {
    Name = "gateway for dev enviroment"
  }
}
# route tables
resource "aws_route_table" "dev-main-public-rt" {
  vpc_id = aws_vpc.dev-env-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-public-gw.id
  }

  tags = {
    Name = "dev-main-public-route-table"
  }
}
# route associations public
resource "aws_route_table_association" "dev-public-vpc-a" {
  subnet_id      = aws_subnet.dev-public-vpc.id
  route_table_id = aws_route_table.dev-main-public-rt.id
}