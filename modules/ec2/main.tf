resource "aws_instance" "jump_server" {
  ami                    = var.ami_id
  instance_type          = var.jump_instance_type
  subnet_id              = var.jump_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jump_sg.id]

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


resource "aws_instance" "private_servers" {
  for_each = var.private_servers

  ami                    = var.ami_id
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = each.key
  }
}