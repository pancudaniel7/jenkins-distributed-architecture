module "worker_vpc" {
    providers = {
      aws = aws.worker
    }
    source   = "./modules/network/vpc"
    name = "worker-dev"
    cidr_block = "10.0.0.0/16"
}

module "worker_iwg" {
    providers = {
      aws = aws.worker
    }
    source   = "./modules/network/iwg"
    vpc_id = module.worker_vpc.id

    depends_on = [
      module.worker_vpc
    ]
}

module "master_vpc" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/vpc"
    name = "master-dev"
    cidr_block = "172.16.0.0/16"
}

module "master_iwg" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/iwg"
    vpc_id = module.master_vpc.id

    depends_on = [
      module.master_vpc
    ]
}

module "worker_network" {
    providers = {
      aws = aws.worker
    }

    source   = "./modules/network/worker"
    subnet1_cidr = "10.0.1.0/24"
    subnet2_cidr = "10.0.2.0/24"
    
    vpc_id = module.worker_vpc.id
    
    availability_zone1 = var.az_worker_a
    availability_zone2 = var.az_worker_b
    iwg_id = module.worker_iwg.id

    depends_on = [
      module.worker_vpc
    ]
}

module "master_network" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/master"
    subnet1_cidr = "172.16.1.0/24"
    vpc_id = module.master_vpc.id
    availability_zone1 = var.az_master_a
    iwg_id = module.master_iwg.id

    depends_on = [
      module.master_vpc
    ]
}