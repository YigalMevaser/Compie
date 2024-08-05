resource "aws_lb" "web" {
  name               = var.alb_name
  internal           = var.alb_isinternal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.subnet_ids
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.web.arn
  port              = var.listener_port #"80"
  protocol          = var.listener_protocol #"HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_lb_target_group" "web" {
  name     = var.target_group_name
  port     = var.tg_port #"80"
  protocol = var.tg_protocol #"HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_security_group" "alb" {
  name        = "allow_http_to_alb"
  description = "Allow HTTP inbound traffic to ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id]
  }
}