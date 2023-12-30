module "worker_common" {
    providers = {
      aws = aws.worker
    }
    source   = "./modules/network/common"
    name = "worker-dev"
    cidr_block = "10.0.0.0/16"
}

module "master_common" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/common"
    name = "master-dev"
    cidr_block = "172.16.0.0/16"
}

module "master_network" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/master"
    subnet1_cidr = var.master_subnet1_cidr

    name = "master-dev"

    vpc_id = module.master_common.vpc_id
    iwg_id = module.master_common.iwg_id

    peering_vpc_id = module.worker_common.vpc_id
    peer_region = var.region_worker

    worker_subnet1_cidr = var.worker_subnet1_cidr
    worker_subnet2_cidr = var.worker_subnet2_cidr

    availability_zone1 = var.az_master_a

    depends_on = [
      module.worker_common,
      module.master_common
    ]
}

module "worker_network" {
    providers = {
      aws = aws.worker
    }

    source   = "./modules/network/worker"
    subnet1_cidr = var.worker_subnet1_cidr
    subnet2_cidr = var.worker_subnet2_cidr

    name = "worker-dev"
    
    vpc_id = module.worker_common.vpc_id
    iwg_id = module.worker_common.iwg_id
    
    availability_zone1 = var.az_worker_a
    availability_zone2 = var.az_worker_b

    master_subnet1_cidr = var.master_subnet1_cidr

    peering_connection_id = module.master_network.peering_connection_id

    depends_on = [
      module.worker_common,
      module.master_network
    ]
}