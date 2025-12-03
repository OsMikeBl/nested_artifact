output "vpc_id" {
  description = "VPC ID from the network module"
  value       = module.network.vpc_id
}

output "cluster_endpoint" {
  description = "Application cluster endpoint"
  value       = module.app_infrastructure.cluster_endpoint
  sensitive   = false
}

output "database_endpoint" {
  description = "Database endpoint"
  value       = module.database.endpoint
  sensitive   = true
}

output "monitoring_dashboard" {
  description = "CloudWatch dashboard URL"
  value       = module.monitoring.dashboard_url
}

output "shared_service_endpoint" {
  description = "Shared services endpoint"
  value       = module.shared_services.endpoint_url
}