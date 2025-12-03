# Local module that itself references external modules
# This creates a nested external reference scenario

module "compute" {
  source = "../../../shared_modules/aws/compute"
  
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  
  environment    = var.environment
  instance_type  = "t3.medium"
}

# Another external reference from within local module
module "storage" {
  source = "../../../../shared_modules/aws/s3"
  
  environment   = var.environment
  bucket_prefix = "complex-test-app"
  
  depends_on = [module.compute]
}

# Deep external reference - utility module
module "scripts" {
  source = "../../../../../external/bash-scripts/aws-helpers"
  
  environment = var.environment
  region     = var.region
}

# Cross-organization reference (very deep)
module "third_party_integration" {
  source = "../../../../../../external/vendors/monitoring-agent"
  
  compute_instances = module.compute.instance_ids
  environment      = var.environment
}