# Complex Test Case Main Configuration
# This file references multiple external modules with various depth levels

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

# Level 1: Direct parent reference - network module
module "network_1" {
  source = "../../../shared_modules/aws/network"
  
  environment    = var.environment
  region        = var.region
  vpc_cidr      = var.vpc_cidr
  project_name  = "complex-test"
}

# Level 2: Deeper reference - security module  
module "security" {
  source = "../../../infrastructure/modules/security"
  
  vpc_id            = module.network_1.vpc_id
  environment       = var.environment
  allowed_cidr_blocks = [var.vpc_cidr]
}

# Level 3: Very deep reference - monitoring tools
module "monitoring" {
  source = "../../../common/observability/cloudwatch"
  
  environment     = var.environment
  log_group_name = "complex-test-${var.environment}"
  
  depends_on = [module.network_1]
}

# Level 4: Cross-project reference 
module "shared_services" {
  source = "../../../shared/services/core"
  
  vpc_id      = module.network_1.vpc_id
  environment = var.environment
  subnet_ids  = module.network_1.private_subnet_ids
}

# Level 5: External library reference
module "utility_functions" {
  source = "../../../external/terraform-utils/aws-helpers"
  
  region = var.region
}

# Application-specific modules with nested references
module "app_infrastructure" {
  source = "./modules/app"  # Local module that has its own external refs
  
  vpc_id               = module.network_1.vpc_id
  security_group_ids   = module.security.security_group_ids
  subnet_id            = module.network_1.private_subnet_ids[0]
  subnet_ids           = module.network_1.private_subnet_ids
  
  environment = var.environment
  region     = var.region
}

# Database module with complex dependencies
module "database" {
  source = "../../../shared_modules/aws/rds"
  
  vpc_id           = module.network_1.vpc_id
  subnet_ids       = module.network_1.private_subnet_ids
  security_groups  = module.security.db_security_group_ids
  
  environment      = var.environment
  db_name         = "complex_test_${var.environment}"
  
  depends_on = [
    module.network_1,
    module.security
  ]
}