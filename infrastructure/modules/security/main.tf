# Mock Security Module for project_root
resource "aws_security_group" "main" {
  name_prefix = "${var.environment}-main-"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.environment}-main-sg"
  }
}

resource "aws_security_group" "database" {
  name_prefix = "${var.environment}-db-"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.main.id]
  }
  
  tags = {
    Name = "${var.environment}-db-sg"
  }
}