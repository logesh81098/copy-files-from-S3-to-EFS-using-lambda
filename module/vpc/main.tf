#############################################################################################################
#                                   Creating VPC
#############################################################################################################
resource "aws_vpc" "project-vpc" {
  cidr_block = var.vpc-cidr-block
  enable_dns_hostnames = true 
  enable_dns_support = true
  tags = {
    Name = "${var.project-name}-VPC"
  }
}

#############################################################################################################
#                                   Creating Subnets
#############################################################################################################
resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.subnet-1-cidr
  availability_zone = var.availability-zone-1
  tags = {
    Name = "Public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.subnet-2-cidr
  availability_zone = var.availability-zone-2
  tags = {
    Name = "Public-subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.subnet-3-cidr
  availability_zone = var.availability-zone-3
  tags = {
    Name = "Public-subnet-3"
  }
}

#############################################################################################################
#                                   Creating Route Table
#############################################################################################################
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.project-vpc.id
  route {
    gateway_id = aws_internet_gateway.internet-gateway.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "Public-route-table"
  }
}


#############################################################################################################
#                                 Route Table Association
#############################################################################################################
resource "aws_route_table_association" "subnet-1-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "subnet-2-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet-2.id
}

resource "aws_route_table_association" "subnet-3-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet-3.id
}

#############################################################################################################
#                                Creating Internet Gateway
#############################################################################################################
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    Name = "${var.project-name}-IGW"
  }
}

#############################################################################################################
#                                Creating VPC Endpoint
#############################################################################################################
resource "aws_vpc_endpoint" "project-vpc-endpoint" {
  vpc_id = aws_vpc.project-vpc.id
  route_table_ids = [aws_route_table.public-route-table.id]
  service_name = "com.amazonaws.ap-south-1.s3"
}

#############################################################################################################
#Total resource count: 10
#############################################################################################################