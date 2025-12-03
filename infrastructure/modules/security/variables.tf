variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed for ingress"
  type        = list(string)
}