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

# Store the private key in AWS Secrets Manager
resource "aws_secretsmanager_secret" "ec2_private_key" {
  name        = "${var.key_name}-private-key"
  description = "Private key for EC2 instance ${var.key_name}"


  #--> For Development / Sandbox
  # recovery_window_in_days = 0 # delete immediately on destroy
  # lifecycle {
  #   create_before_destroy = true
  # } 


  #--> For Production
  # Keep default 7-day recovery (don’t set recovery_window_in_days)
  # lifecycle {
  #   create_before_destroy = true
  # }

  tags = {
    Name = "${var.key_name}-private-key"
  }
}

# Create a secret version containing the PEM content
resource "aws_secretsmanager_secret_version" "ec2_private_key_version" {
  secret_id     = aws_secretsmanager_secret.ec2_private_key.id
  secret_string = tls_private_key.ec2_key.private_key_pem
}









# # Generate an RSA private key locally
# resource "tls_private_key" "ec2_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# # Create an AWS key pair using the generated public key
# resource "aws_key_pair" "ec2_keypair" {
#   key_name   = var.key_name
#   public_key = tls_private_key.ec2_key.public_key_openssh

#   tags = {
#     Name = var.key_name
#   }
# }

# # Save private key to local file (so you can SSH later)
# resource "local_file" "private_key" {
#   content  = tls_private_key.ec2_key.private_key_pem
#   filename = "${path.module}/${var.key_name}.pem"

#   provisioner "local-exec" {
#     command = "chmod 400 ${path.module}/${var.key_name}.pem"
#   }
# }
