output "vpc_id" {
  description = "ID of the VPC from shared module"
  value       = module.shared_aws_infrastructure.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs from shared module"
  value       = module.shared_aws_infrastructure.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs from shared module"
  value       = module.shared_aws_infrastructure.private_subnet_ids
}

output "load_balancer_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.app_lb.arn
}

output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app_lb.dns_name
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "alb_security_group_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.alb_sg.id
}