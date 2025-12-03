module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  vpc_name        = var.vpc_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  key_name = var.key_name
  ami_id = var.ami_id

  # jump server
  jump_instance_type = var.jump_instance_type
  jump_subnet_id = module.vpc.public_subnet_ids[0]
  
  # private server
  private_servers = {
    private-server-1 = {
      instance_type = var.private1_instance_type
      subnet_id     = module.vpc.private_subnet_ids[0]
    }
  private-server-2 = {
      instance_type = var.private2_instance_type
      subnet_id     = module.vpc.private_subnet_ids[1]
    }
  }
}