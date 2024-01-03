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
  default = "ami-09042b2f6d07d164a" # eu-central-1
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "security_group_id" {
  description = "Sec urity group ID"
}