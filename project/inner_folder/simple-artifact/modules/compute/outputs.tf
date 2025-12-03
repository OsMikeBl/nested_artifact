output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.simple.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.simple.public_ip
}