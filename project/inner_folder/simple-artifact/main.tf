terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Module 1: External reference with ../../ path
module "external_storage" {
  source = "../../shared_modules/aws/s3"
  
  bucket_name = "${var.environment}-simple-storage"
  environment = var.environment
}

# Module 2: Reference to upper_module
module "upper_level" {
  source = "../../../upper_module"
  
  region      = var.region
  environment = var.environment
}

# Module 3: Internal submodule (no ../ path, inside this artifact)
module "internal_compute" {
  source = "./modules/compute"
  
  environment = var.environment
  region      = var.region
}

# Module 4: Reference to common module (which references subnet)
module "common_infrastructure" {
  source = "../../common"
  
  vpc_id      = "vpc-12345"  # Example VPC ID
  name_prefix = "${var.environment}-common"
  environment = var.environment
}