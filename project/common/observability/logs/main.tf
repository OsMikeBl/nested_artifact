terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/${var.log_prefix}/${var.environment}"
  retention_in_days = 14
  
  tags = {
    Environment = var.environment
    Purpose     = "Application logs"
  }
}