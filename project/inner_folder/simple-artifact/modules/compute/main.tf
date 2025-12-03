terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Reference to networking module using relative path
module "networking" {
  source = "../networking"
  
  environment         = var.environment
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

# Reference to storage module using relative path
module "storage" {
  source = "../../storage"
  
  environment = var.environment
  bucket_name = "compute-storage"
}

# Reference to infrastructure module using relative path
module "infrastructure" {
  source = "../infrs/infrastructure"
  
  environment          = var.environment
  project_name        = "simple-artifact"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]
}

# Simple EC2 instance
resource "aws_instance" "simple" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = length(module.infrastructure.public_subnet_ids) > 0 ? module.infrastructure.public_subnet_ids[0] : module.networking.public_subnet_id
  
  tags = {
    Name        = "${var.environment}-simple-compute"
    Environment = var.environment
    VPC         = module.infrastructure.vpc_id
  }
}

# Get latest Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}