variable "environment" {
  description = "Environment name for resource naming"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  type        = string
}