variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs for the application"
  type        = list(string)
}

variable "monitoring_config" {
  description = "Monitoring configuration from parent module"
  type        = any
}

variable "shared_service_url" {
  description = "Shared service endpoint URL"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for deployment"
  type        = list(string)
  default     = []
}