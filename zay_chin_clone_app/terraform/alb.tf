resource "aws_lb" "main" {
 name = "zaywalapplb"
 internal = false
 load_balancer_type = "application"
 security_groups = [ aws_security_group.alb.id ]
 subnets = [ for subnet in aws_subnet.public : subnet.id ]
}

resource "aws_lb_target_group" "api" {
  name = "zaywalapitg-02"
  port = 4000
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id
  target_type = "ip"

  health_check {
    healthy_threshold = 5
    interval = 30
    protocol = "HTTP"
    timeout = 5
    path = var.health_check_path
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group" "admin" {
  name = "zaywaladmintg-02"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id
  target_type = "ip"

  health_check {
    healthy_threshold = 5
    interval = 30
    protocol = "HTTP"
    timeout = 5
    path = "/"
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "api" {
  load_balancer_arn = aws_lb.main.arn
  port = var.api_port
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.api.arn
  }
}

resource "aws_lb_listener" "admin" {
  load_balancer_arn = aws_lb.main.arn
  port = var.admin_port
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.admin.arn
  }
}