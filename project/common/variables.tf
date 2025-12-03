variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
  default     = "common"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
