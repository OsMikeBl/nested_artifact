output "endpoint_url" {
  description = "Shared services endpoint URL"
  value       = "https://${aws_lb.main.dns_name}"
}

output "load_balancer_arn" {
  description = "Load balancer ARN"
  value       = aws_lb.main.arn
}