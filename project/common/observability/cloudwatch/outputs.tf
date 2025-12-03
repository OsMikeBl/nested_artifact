output "config" {
  description = "Monitoring configuration"
  value = {
    log_group_name = aws_cloudwatch_log_group.main.name
    log_group_arn  = aws_cloudwatch_log_group.main.arn
  }
}

output "dashboard_url" {
  description = "CloudWatch dashboard URL"
  value       = "https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#dashboards:name=${aws_cloudwatch_dashboard.main.dashboard_name}"
}