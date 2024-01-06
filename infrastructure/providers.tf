terraform {
  required_providers {
    aws = ">=3.0.0"
  }
}

provider "aws" {
  profile = "zeph"
  region  = var.region_master
  alias   = "master"
}

provider "aws" {
  profile = "zeph"
  region  = var.region_worker
  alias   = "worker"
}