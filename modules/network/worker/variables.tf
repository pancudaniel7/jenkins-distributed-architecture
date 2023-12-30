variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet1_cidr" {
  description = "The CIDR block for the first subnet"
}

variable "subnet2_cidr" {
  description = "The CIDR block for the first subnet"
}

variable "availability_zone1" {
  description = "The availability zone for the first subnet"
}

variable "availability_zone2" {
  description = "The availability zone for the second subnet"
}

variable "iwg_id" {
  description = "Internet gateway ID"
}

variable "name" {
  description = "Universal name"
}

variable "peering_connection_id" {
  description = "Peering connection ID"
}

variable "master_subnet1_cidr" {
  description = "Peering connection ID"
}