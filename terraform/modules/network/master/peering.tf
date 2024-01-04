resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peering_vpc_id
  peer_region   = var.peer_region

  auto_accept = false

  tags = {
    Name = "${var.name}-cross-region-peer"
  }
}