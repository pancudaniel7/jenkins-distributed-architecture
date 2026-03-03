resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.iwg_id
  }

  tags = {
    Name = "${var.name}-public-route-table"
  }
}

resource "aws_route_table_association" "subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "master_to_worker_subnet_a" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.worker_subnet1_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "master_to_worker_subnet_b" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.worker_subnet2_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}