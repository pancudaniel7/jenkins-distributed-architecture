resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_internet_gateway" "iwg" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-internet-gateway"
  }
}