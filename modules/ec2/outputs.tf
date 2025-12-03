output "jump_server_id" {
  value = aws_instance.jump_server.id
}

output "jump_server_public_ip" {
  value = aws_instance.jump_server.public_ip
}

output "private_servers_ids" {
  value = { for k, v in aws_instance.private_servers : k => v.id }
}

output "private_server_ips" {
  value = { for k, v in aws_instance.private_servers : k => v.private_ip }
}