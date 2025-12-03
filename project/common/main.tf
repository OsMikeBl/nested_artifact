# Common module that references subnet module
module "subnet_config" {
  source = "../../subnet"
  
  vpc_id      = var.vpc_id
  name_prefix = var.name_prefix
  
  public_subnet_cidrs = var.public_subnet_cidrs
  tags = {
    Environment = var.environment
    Module      = "common"
  }
}

# Output subnet information
output "subnet_info" {
  description = "Information from subnet module"
  value = module.subnet_config
}
