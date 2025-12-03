# Mock Shared Services Core Module
resource "aws_lb" "main" {
  name               = "${var.environment}-shared-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = []
  subnets           = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "main" {
  name     = "${var.environment}-shared-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = {
    Environment = var.environment
  }
}