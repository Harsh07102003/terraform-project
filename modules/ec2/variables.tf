variable "ami_id" {
  description = "ami id for ec2 instance"
  type = string
}

variable "instance_type" {
  description = "ec2 instance type"
  type = string
}

variable "key_name" {
  description = "ssh key pair name"
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "public_subnet_id" {
  description = "public subnet id for jump server"
  type = string
}

variable "private_subnet_id" {
  description = "private subnet id for private server"
  type = string
}

variable "jump_server_name" {
  description = "jump server name"
  type        = string
}

variable "private_server_name" {
  description = "private server name"
  type        = string
}