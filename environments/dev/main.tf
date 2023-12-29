module "network_common_worker" {
    providers = {
      aws = aws.worker
    }
    source   = "./modules/network/common"
    name = "worker-dev"
    cidr_block = "10.0.0.0/16"
}

module "network_common_master" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/common"
    name = "master-dev"
    cidr_block = "172.16.0.0/16"
}

module "network_master" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/master"
    subnet1_cidr = "172.16.1.0/24"
    vpc_id = module.network_common_master.vpc_id
    availability_zone1 = var.az_master_a
}

