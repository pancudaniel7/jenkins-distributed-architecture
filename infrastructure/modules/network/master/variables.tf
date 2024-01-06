variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet1_cidr" {
  description = "The CIDR block for the first subnet"
}

variable "availability_zone1" {
  description = "The availability zone for the first subnet"
}

variable "iwg_id" {
  description = "Internet gateway ID"
}

variable "name" {
  description = "Universal name"
}

variable "peer_region" {
  description = "Peering region"
}

variable "peering_vpc_id" {
  description = "Peering vpc ID"
}

variable "worker_subnet1_cidr" {
  description = "The CIDR block for the first subnet"
}

variable "worker_subnet2_cidr" {
  description = "The CIDR block for the first subnet"
}
