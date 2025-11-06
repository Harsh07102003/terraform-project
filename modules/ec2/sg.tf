# jump server sg
resource "aws_security_group" "jump_sg" {
  name = "jump-sg"
  description = "Allow SSH access from the internet"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jump-sg"
  }
}

# private server sg
resource "aws_security_group" "private_sg" {
  name = "private-sg"
  description = "Allow SSH only from Jump Server"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow SSH from Jump Server"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [ aws_security_group.jump_sg.id ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}