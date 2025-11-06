variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnets with AZ and CIDR"
  type = map(object({
    az   = string
    cidr = string
  }))
}

variable "private_subnets" {
  description = "Map of private subnets with AZ and CIDR"
  type = map(object({
    az   = string
    cidr = string
  }))
}
