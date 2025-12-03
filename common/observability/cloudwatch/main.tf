# Mock Common CloudWatch Module (moved to project_root)
resource "aws_cloudwatch_log_group" "main" {
  name              = var.log_group_name
  retention_in_days = 30
  
  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.environment}-dashboard"
  
  dashboard_body = jsonencode({
    widgets = [{
      type   = "metric"
      x      = 0
      y      = 0
      width  = 12
      height = 6
      
      properties = {
        metrics = [
          ["AWS/Logs", "IncomingLogEvents", "LogGroupName", aws_cloudwatch_log_group.main.name]
        ]
        view    = "timeSeries"
        stacked = false
        region  = "us-east-1"
        title   = "Log Events"
        period  = 300
      }
    }]
  })
}