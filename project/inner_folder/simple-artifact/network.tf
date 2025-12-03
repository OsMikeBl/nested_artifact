# Module 3: Another module in separate file, also at root level
module "monitoring" {
  source = "../../common/observability/logs"
  
  environment = var.environment
  log_prefix  = "simple-artifact"
}