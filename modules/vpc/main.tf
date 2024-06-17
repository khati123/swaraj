provider "aws" {
  region = var.region
}

# Create VPC

resource "aws_vpc" "main" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Create Subnet

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_subnet1
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-subnet"
  }
}

# Create Internet Gateway & Attach to VPC

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# Create route table in VPC & add route to IGW.

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

# Associate Route Table with the subnet

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Create Security Group

resource "aws_security_group" "allow_web" {
  name        = "Terra-Allow-Traffic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
