output "vpc_id" {
  value = aws_vpc.vpc.id
  description = "The ID of the VPC."
}

output "iwg_id" {
  value = aws_internet_gateway.iwg.id
  description = "The ID of the IWG."
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}