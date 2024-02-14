variable "public_key_path" {
  description = "SSH public key path"
}

variable "public_key_name" {
  description = "SSH public key name"
}

variable "instance_type" {
  description = "Type of ec2 instance"
  default = "t2.micro"
}

variable "name" {
  description = "Ec2 instance name"
}

variable "ami_id" {
  description = "AMI image ID"
  default = "ami-Ofc02b454efabb390" # eu-central-1
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "security_group_id" {
  description = "Security group ID"
}