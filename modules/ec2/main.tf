# Jump server
resource "aws_instance" "jump_server" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.jump_sg.id]
  key_name = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "jump-server"
  }
}

# Attach Elastic IP to Jump Server
resource "aws_eip" "jump_eip" {
  domain = "vpc"
  tags = {
    Name = "jump-server-eip"
  }
}

resource "aws_eip_association" "jump_eip_assoc" {
  instance_id   = aws_instance.jump_server.id
  allocation_id = aws_eip.jump_eip.id
}


# private server
resource "aws_instance" "private_server" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name = var.key_name

  tags = {
    Name = "private-server"
  }
}