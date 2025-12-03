output "storage_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.external_storage.bucket_name
}

output "compute_instance_id" {
  description = "ID of the compute instance"
  value       = module.internal_compute.instance_id
}

output "compute_instance_public_ip" {
  description = "Public IP of the compute instance"
  value       = module.internal_compute.instance_public_ip
}

output "monitoring_log_group" {
  description = "Name of the monitoring log group"
  value       = module.monitoring.log_group_name
}