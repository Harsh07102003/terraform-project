aws_region = "ap-south-1"

vpc_cidr   = "10.0.0.0/16"

vpc_name   = "test-vpc"

public_subnets = {
  public-1 = { az = "ap-south-1a", cidr = "10.0.1.0/24" }
  public-2 = { az = "ap-south-1b", cidr = "10.0.2.0/24" }
  public-3 = { az = "ap-south-1c", cidr = "10.0.3.0/24" }
}

private_subnets = {
  private-1 = { az = "ap-south-1a", cidr = "10.0.11.0/24" }
  private-2 = { az = "ap-south-1b", cidr = "10.0.12.0/24" }
  private-3 = { az = "ap-south-1c", cidr = "10.0.13.0/24" }
}

ami_id = "ami-02b8269d5e85954ef"

instance_type = "t3.micro"

key_name = "my-key-pair"

jump_server_name = "jump-server"

private_server_name = "private-server"

# bucket_name = "tf-state-ozxcs"