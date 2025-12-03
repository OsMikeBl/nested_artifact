output "security_group_ids" {
  description = "Main security group IDs"
  value       = [aws_security_group.main.id]
}

output "db_security_group_ids" {
  description = "Database security group IDs"
  value       = [aws_security_group.database.id]
}