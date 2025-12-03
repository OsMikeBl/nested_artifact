output "app_instance_id" {
  description = "ID of the application instance"
  value       = aws_instance.app.id
}

output "app_instance_private_ip" {
  description = "Private IP of the application instance"
  value       = aws_instance.app.private_ip
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.app.dns_name
}

output "load_balancer_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.app.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.app.arn
}