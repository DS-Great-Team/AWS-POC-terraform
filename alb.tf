resource "aws_lb" "alb-poc" {
    name               = alb-poc
    load_balancer_type = "application"
    subnets            = aws_subnet_ids.public-subnet-a.ids
    security_groups    = [aws_security_group.alb.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb-poc.arn
  port              = 80
  protocol          = "HTTP"
 
  default_action {
    type = "fixed-response"
 
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}
 
resource "aws_lb_target_group" "tg-poc" {
 
  name = tg-poc
 
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
 
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
 
resource "aws_lb_listener_rule" "lr-poc" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100
 
  condition {
    field  = "path-pattern"
    values = ["*"]
  }
 
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-poc.arn
  }
}
