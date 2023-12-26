variable "env" {
  type    = string
  default = "default"
}

variable "region_master" {
  type    = string
  default = "eu-central-1"
}

variable "region_worker" {
  type    = string
  default = "eu-west-1"
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