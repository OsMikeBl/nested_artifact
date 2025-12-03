# Mock Logging Module
resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/rds/${var.resource_name}"
  retention_in_days = 7

  tags = {
    Environment = var.environment
  }
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.main.name
}