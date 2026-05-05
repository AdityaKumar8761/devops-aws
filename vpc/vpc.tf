resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.1/24"
  availability_zone = "us-east-1a"
  tags = {
     Name = "public-subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.2/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-east-1c" 
  cidr_block = "10.0.1.3/24"

  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.4/24"
  availability_zone = "us-east-1d"

  tags = {
    Name = "private-subnet-2"
  }
}


resource "aws_nat_gateway" "gw" {
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "gw NAT"
  }
}


resource "aws_nat_gateway" "gw" {
  subnet_id     = aws_subnet.public_subnet2.id

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.main.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.foo.id
  }

  tags = {
    Name = "main"
  }
}