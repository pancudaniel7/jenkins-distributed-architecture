variable "profile" {
  type    = string
  default = "default"
}

variable "env" {
  type    = string
  default = "default"
}

variable "region_master" {
  type    = string
  default = "eu-central-1"
}

variable "az_master_a" {
  type    = string
  default = "eu-central-1a"
}

variable "region_worker" {
  type    = string
  default = "eu-west-1"
}

variable "az_worker_a" {
  type    = string
  default = "eu-west-1a"
}

variable "az_worker_b" {
  type    = string
  default = "eu-west-1b"
}

variable "regions" {
  description = "All the regions used"
  default     = ["eu-central-1", "eu-west-1"]  # Add as many regions as needed
}

variable "master_instances_names" {
  description = "All the regions used"
  default     = ["master_instance1", "master_instance2"]
}

variable "worker_instances_names" {
  description = "All the regions used"
  default     = ["worker_instance1"]
}

variable "master_subnet1_cidr" {
  default     = "172.16.1.0/24"
  description = "Worker subnet2 cidr"
}

variable "worker_subnet1_cidr" {
  default     = "10.0.1.0/24"
  description = "Worker subnet1 cidr"
}

variable "worker_subnet2_cidr" {
  default     = "10.0.2.0/24"
  description = "Worker subnet2 cidr"
}

variable "ssh_public_key_path" {
  type    = string
}

variable "ssh_key_name" {
  type    = string
  default = "jenkins_infra"
}