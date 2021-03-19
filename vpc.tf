# Internet VPC
resource "aws_vpc" "Terraform-VPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "Terraform-VPC"
  }
}

# Subnets
resource "aws_subnet" "Terraform-Subnet-A" {
  vpc_id                  = aws_vpc.Terraform-VPC.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "Terraform-Subnet-A"
  }
}
resource "aws_subnet" "Terraform-Subnet-B" {
  vpc_id                  = aws_vpc.Terraform-VPC.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-1b"
  tags = {
    Name = "Terraform-Subnet-B"
  }
}

# Internet GW
resource "aws_internet_gateway" "Terraform-Internet-Gateway" {
  vpc_id = aws_vpc.Terraform-VPC.id
  tags = {
    Name = "Terraform-Internet-Gateway"
  }
}

# route tables
resource "aws_route_table" "Terraform-Route-Table" {
  vpc_id = aws_vpc.Terraform-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraform-Internet-Gateway.id
  }
  tags = {
    Name = "Terraform-Route-Table"
  }
}

# route associations public
resource "aws_route_table_association" "Terraform-Subnet-A" {
  subnet_id      = aws_subnet.Terraform-Subnet-A.id
  route_table_id = aws_route_table.Terraform-Route-Table.id
}
resource "aws_route_table_association" "Terraform-Subnet-B" {
  subnet_id      = aws_subnet.Terraform-Subnet-B.id
  route_table_id = aws_route_table.Terraform-Route-Table.id
}