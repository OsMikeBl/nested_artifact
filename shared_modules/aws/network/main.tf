# Mock Network Module for project_root
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name        = "${var.project_name}-vpc-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "private" {
  count  = 3
  vpc_id = aws_vpc.main.id
  
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  
  tags = {
    Name = "${var.project_name}-private-${count.index + 1}-${var.environment}"
    Type = "private"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}