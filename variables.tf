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

variable "ami_id" {
  description = "ami id for ec2 instance"
  type = string
}

variable "instance_type" {
  description = "ec2 instance type"
  type = string
  default = "t3.micro"
}

variable "key_name" {
  description = "ssh key pair name"
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

variable "bucket_name" {
  description = "s3 bucket for remote state"
  type = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for state locking"
  type = string
}