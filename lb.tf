resource "aws_lb" "ghost_lb" {
  name               = "ghost-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ghost_lb_security_group.id]
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  tags = var.tags
}

resource "aws_lb_listener" "ghost_lb_listener" {
  load_balancer_arn = aws_lb.ghost_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ghost_lb_target_group.arn
  }
  tags = var.tags
}

resource "aws_lb_target_group" "ghost_lb_target_group" {
  name                 = "ghost-lb-target-group"
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 180
  vpc_id               = module.vpc.vpc_id
  health_check {
    healthy_threshold = 3
    interval          = 10
  }
  tags = var.tags
}

resource "aws_security_group" "ghost_lb_security_group" {
  name   = "ghost_lb_security_group"
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}
