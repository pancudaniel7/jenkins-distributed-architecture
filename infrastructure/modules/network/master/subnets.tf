resource "aws_subnet" "subnet1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = "${var.name}-subnet1"
  }
}