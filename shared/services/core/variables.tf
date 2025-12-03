variable "vpc_id" {
  description = "VPC ID where shared services will be deployed"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for load balancer"
  type        = list(string)
}