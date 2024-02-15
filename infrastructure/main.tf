module "common_worker" {
    providers = {
      aws = aws.worker
    }
    source   = "./modules/network/common"
    name = "worker-${var.env}"
    cidr_block = "10.0.0.0/16"
}

module "common_master" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/common"
    name = "master-${var.env}"
    cidr_block = "172.16.0.0/16"
}

module "master_network" {
    providers = {
      aws = aws.master
    }
    source   = "./modules/network/master"
    subnet1_cidr = var.master_subnet1_cidr

    name = "master-${var.env}"

    vpc_id = module.common_master.vpc_id
    iwg_id = module.common_master.iwg_id

    peering_vpc_id = module.common_worker.vpc_id
    peer_region = var.region_worker

    worker_subnet1_cidr = var.worker_subnet1_cidr
    worker_subnet2_cidr = var.worker_subnet2_cidr

    availability_zone1 = var.az_master_a

    depends_on = [
      module.common_worker,
      module.common_master
    ]
}

module "worker_network" {
    providers = {
      aws = aws.worker
    }

    source   = "./modules/network/worker"
    subnet1_cidr = var.worker_subnet1_cidr
    subnet2_cidr = var.worker_subnet2_cidr

    name = "worker-${var.env}"
    
    vpc_id = module.common_worker.vpc_id
    iwg_id = module.common_worker.iwg_id
    
    availability_zone1 = var.az_worker_a
    availability_zone2 = var.az_worker_b

    master_subnet1_cidr = var.master_subnet1_cidr
    peering_connection_id = module.master_network.peering_connection_id

    depends_on = [
      module.common_worker,
      module.master_network
    ]
}

module "worker_first_ec2" {
  providers = {
      aws = aws.worker
  }
  source   = "./modules/computing/ec2"
  
  name = "worker-${var.env}-node1"
  ami_id = "ami-0905a3c97561e0b69"
  instance_type = "t3.micro"
  
  public_key_path = var.ssh_public_key_path
  public_key_name = var.ssh_key_name
  
  subnet_id = module.worker_network.subnet1_id
  security_group_id = module.worker_security_groups.ec2_security_group_id

  depends_on = [
     module.worker_network,
     module.worker_security_groups
  ]
}

module "worker_security_groups" {
  providers = {
      aws = aws.worker
  }
  source = "./modules/security/worker_security_group"
  ec2_security_group_name = "worker-${var.env}-common-security-groups"
  vpc_id = module.common_worker.vpc_id

  depends_on = [
     module.common_worker
  ]
}

module "master_security_groups" {
  providers = {
      aws = aws.master
  }
  source = "./modules/security/master_security_group"
  ec2_security_group_name = "master-${var.env}-common-security-groups"
  vpc_id = module.common_master.vpc_id

  depends_on = [
     module.common_master
  ]
}

module "worker_second_ec2" {
  providers = {
      aws = aws.worker
  }
  source   = "./modules/computing/ec2"
  
  name = "worker-${var.env}-node2"
  ami_id = "ami-0905a3c97561e0b69"
  instance_type = "t3.micro"
  
  public_key_path = var.ssh_public_key_path
  public_key_name = var.ssh_key_name
  
  subnet_id = module.worker_network.subnet2_id
  security_group_id = module.worker_security_groups.ec2_security_group_id

  depends_on = [
     module.worker_network,
     module.worker_security_groups
  ]
}

module "master_first_ec2" {
  providers = {
      aws = aws.master
  }
  source   = "./modules/computing/ec2"
  
  name = "master-${var.env}-node1"
  ami_id = "ami-0faab6bdbac9486fb"
  instance_type = "t3.micro"
  
  public_key_path = var.ssh_public_key_path
  public_key_name = var.ssh_key_name
  
  subnet_id = module.master_network.subnet1_id
  security_group_id = module.master_security_groups.ec2_security_group_id

  depends_on = [
     module.master_network,
     module.master_security_groups
  ]
}

