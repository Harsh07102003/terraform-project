# Generate an RSA private key locally
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS key pair using the generated public key
resource "aws_key_pair" "ec2_keypair" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key.public_key_openssh

  tags = {
    Name = var.key_name
  }
}

# Save private key to local file (so you can SSH later)
resource "local_file" "private_key" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/${var.key_name}.pem"

  provisioner "local-exec" {
    command = "chmod 400 ${path.module}/${var.key_name}.pem"
  }
}
