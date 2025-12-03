# Mock External Terraform Utils AWS Helpers
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

# Helper for generating unique names
resource "random_id" "suffix" {
  byte_length = 4
}

# Common tags helper
locals {
  common_tags = {
    ManagedBy = "terraform"
    Region    = var.region
    AccountId = local.account_id
    UniqueId  = random_id.suffix.hex
  }
}