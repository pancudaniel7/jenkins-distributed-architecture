output "peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
  description = "Master peering conenction ID"
}

output "subnet1_id" {
  value       = aws_subnet.subnet1.id
  description = "The ID of the subnet"
}