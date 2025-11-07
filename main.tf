module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
}

module "ec2" {
  source = "./modules/ec2"
  jump_server_name = var.jump_server_name
  private_server_name = var.private_server_name
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  private_subnet_id = module.vpc.private_subnet_ids[0]
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}