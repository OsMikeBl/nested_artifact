output "cluster_endpoint" {
  description = "Application cluster endpoint"
  value       = module.compute.cluster_endpoint
}

output "storage_bucket" {
  description = "S3 bucket name for application storage"
  value       = module.storage.bucket_name
}

output "script_outputs" {
  description = "Outputs from utility scripts"
  value       = module.scripts.outputs
}

output "monitoring_agent_status" {
  description = "Third party monitoring agent status"
  value       = module.third_party_integration.agent_status
}