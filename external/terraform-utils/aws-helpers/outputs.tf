output "account_id" {
  description = "Current AWS account ID"
  value       = local.account_id
}

output "region" {
  description = "Current AWS region"
  value       = local.region
}

output "common_tags" {
  description = "Common tags for resources"
  value       = local.common_tags
}

output "unique_suffix" {
  description = "Unique suffix for resource naming"
  value       = random_id.suffix.hex
}