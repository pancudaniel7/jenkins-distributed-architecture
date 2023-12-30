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

module "worker_network" {
    providers = {
      aws = aws.worker
    }

    source   = "./modules/network/worker"
    subnet1_cidr = "10.0.1.0/24"
    subnet2_cidr = "10.0.2.0/24"
    
    vpc_id = module.worker_common.vpc_id
    iwg_id = module.worker_common.iwg_id
    
    availability_zone1 = var.az_worker_a
    availability_zone2 = var.az_worker_b
    

    depends_on = [
      module.worker_common
    ]
}

module "master_network" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/master"
    subnet1_cidr = "172.16.1.0/24"
    vpc_id = module.master_common.vpc_id
    iwg_id = module.master_common.iwg_id

    availability_zone1 = var.az_master_a

    depends_on = [
      module.master_common
    ]
}