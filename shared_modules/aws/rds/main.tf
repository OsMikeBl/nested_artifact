# Mock RDS Module
# Test: Add reference to external logging module
module "logging" {
  source = "../../../common/logging"
  
  environment = var.environment
  resource_name = "rds-${var.db_name}"
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "main" {
  allocated_storage      = 20
  storage_type          = "gp2"
  engine                = "postgres"
  engine_version        = "13.7"
  instance_class        = "db.t3.micro"
  db_name               = var.db_name
  username              = "admin"
  password              = "changeme123!"
  vpc_security_group_ids = var.security_groups
  db_subnet_group_name  = aws_db_subnet_group.main.name
  skip_final_snapshot   = true

  tags = {
    Name        = "${var.environment}-database"
    Environment = var.environment
  }
}