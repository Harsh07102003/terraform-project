variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "key_name" { 
  type = string 
}

variable "jump_instance_type" { 
  type = string 
}

variable "private1_instance_type" { 
  type = string 
}

variable "private2_instance_type" { 
  type = string 
}

variable "ami_id" { 
  type = string 
}

variable "public_subnets" {
  description = "Public subnet details"
  type = map(object({
    az   = string
    cidr = string
  }))
}

variable "private_subnets" {
  description = "Private subnet details"
  type = map(object({
    az   = string
    cidr = string
  }))
}