resource "aws_internet_gateway" "iwg" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main-internet-gateway"
  }
}