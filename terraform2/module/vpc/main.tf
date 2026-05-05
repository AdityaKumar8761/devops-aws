resource "aws_vpc" "terraform_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}


//puclic subnet

resource "aws_subnet" "public_subnet_terraform" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_terraform"
  }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.terraform_vpc.id
}

resource "aws_route" "public_internet" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id = aws_subnet.public_subnet_terraform.id
  route_table_id = aws_route_table.public_rt.id
}





resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform-igw"
  }
}


//private 



resource "aws_subnet" "private_subnet_terraform" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "sa-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet_terraform"
  }
}

resource "aws_eip" "nat_eip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "gw_Nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_terraform.id

  tags = {
    Name = "gw-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
}

resource "aws_route" "private_internet" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.gw_Nat.id
}

resource "aws_route_table_association" "private_associate" {
    subnet_id = aws_subnet.private_subnet_terraform.id
    route_table_id = aws_route_table.private_rt.id
}

