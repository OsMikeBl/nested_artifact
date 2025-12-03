# Upper level module that references inner module
module "simple_artifact" {
  source = "../project/inner_folder/simple-artifact/modules/networking"
  
  environment = var.environment
  vpc_cidr    = "10.0.0.0/16"
}

# Output from upper module
output "compute_info" {
  description = "Information from compute module"
  value = module.simple_artifact
}
