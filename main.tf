resource "aws_vpc" "New-VPC-nov" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "New-VPC-nov"
  }
}

resource "aws_subnet" "Sub-Nov-Pub1" {
  vpc_id     = aws_vpc.New-VPC-nov.id
  cidr_block = var.sub-1-pub-cidr_block

  tags = {
    Name = "Sub-Nov-Pub1"
  }
}

resource "aws_subnet" "Sub-Nov-Prv1" {
  vpc_id     = aws_vpc.New-VPC-nov.id
  cidr_block = var.sub-1-prv-cidr_block

  tags = {
    Name = "Sub-Nov-Prv1"
  }
}



resource "aws_route_table" "Route-Nov-Pub1" {
  vpc_id = aws_vpc.New-VPC-nov.id

  route = []

  tags = {
    Name = "Route-Nov-Pub1"
  }
}

resource "aws_route_table" "Route-Nov-Prv1" {
  vpc_id = aws_vpc.New-VPC-nov.id

  route = []

  tags = {
    Name = "Route-Nov-Prv1"
  }
}

resource "aws_route_table_association" "routetbass1" {
  subnet_id      = aws_subnet.Sub-Nov-Pub1.id
  route_table_id = aws_route_table.Route-Nov-Pub1.id
}

resource "aws_route_table_association" "routetbass2" {
  subnet_id      = aws_subnet.Sub-Nov-Prv1.id
  route_table_id = aws_route_table.Route-Nov-Prv1.id
}

resource "aws_internet_gateway" "igw-New-nov" {
  vpc_id = aws_vpc.New-VPC-nov.id

  tags = {
    Name = "New-VPC-nov"
    }
}

resource "aws_route" "routetbass1" {
  route_table_id            = aws_route_table.Route-Nov-Pub1.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw-New-nov.id
}



