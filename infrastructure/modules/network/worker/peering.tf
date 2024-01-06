resource "aws_vpc_peering_connection_accepter" "peer_accept" {

  vpc_peering_connection_id = var.peering_connection_id
  auto_accept               = true

  tags = {
    Name = "${var.name}-cross-region-peer-accept"
  }
}