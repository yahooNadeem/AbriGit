output "ec2_id" {
  value = aws_instance.windows_server.id
}

output "ec2_private_ip" {
  value = aws_instance.windows_server.private_ip
}
