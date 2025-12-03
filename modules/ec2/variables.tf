# Jump server inputs
variable "ami_id" { 
  type = string 
}

variable "jump_instance_type" { 
  type = string 
}

variable "jump_subnet_id" { 
  type = string 
}


# Private servers map
variable "private_servers" {
  description = "Map of private server configurations"
  type = map(object({
    instance_type = string
    subnet_id     = string
  }))
}

variable "key_name" { 
  type = string 
}

variable "vpc_id"   { 
  type = string 
}