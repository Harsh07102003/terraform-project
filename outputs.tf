# VPC Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}


# EC2 Outputs
# Jump Server
output "jump_server_public_ip" {
  value = module.ec2.jump_server_public_ip
}

# Private Server
output "private_server_ips" {
  value = module.ec2.private_server_ips
}