# Internet VPC
resource "aws_vpc" "main-application-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "main application vpc"
  }
}
# Public Subnets
resource "aws_subnet" "main-public-vpc" {
  vpc_id                  = aws_vpc.main-application-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "main-public-vpc"
  }
}

resource "aws_subnet" "main-public-vpc-2" {
  vpc_id                  = aws_vpc.main-application-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "main-public-vpc-2"
  }
}
#Private Subnets
# resource "aws_subnet" "main-private-subnet" {
#   vpc_id                  = aws_vpc.main-application-vpc.id
#   cidr_block              = "10.0.4.0/24"
#   map_public_ip_on_launch = "false"
#   availability_zone       = "us-east-1a"

#   tags = {
#     Name = "main-private-subnet-1"
#   }
# }

# Internet GW
resource "aws_internet_gateway" "main-public-gw" {
  vpc_id = aws_vpc.main-application-vpc.id

  tags = {
    Name = "gateway for main public"
  }
}
# route tables
resource "aws_route_table" "main-public-rt" {
  vpc_id = aws_vpc.main-application-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-public-gw.id
  }

  tags = {
    Name = "main-public-route-table"
  }
}
# route associations public
resource "aws_route_table_association" "main-public-vpc-a" {
  subnet_id      = aws_subnet.main-public-vpc.id
  route_table_id = aws_route_table.main-public-rt.id
}

resource "aws_route_table_association" "main-public-vpc-b" {
  subnet_id      = aws_subnet.main-public-vpc-2.id
  route_table_id = aws_route_table.main-public-rt.id
}