# create application load balancer
resource "aws_lb" "application_load_balancer" {
  name               = "${var.APP_NAME}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ALB_SECURITY_GROUP]
  subnets            = [var.PUBLIC_SUBNET_1_ID,var.PUBLIC_SUBNET_2_ID]
  enable_deletion_protection = false

  tags   = {
    Name = "${var.APP_NAME}-alb"
  }
}

# create target group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.APP_NAME}-alb-tg"
  target_type = "ip"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.VPC_ID

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }

  tags   = {
    Name = "${var.APP_NAME}-alb-tg"
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }


  # default_action {
  #   type = "redirect"

  #   redirect {
  #     port        = 443
  #     protocol    = "HTTPS"
  #     status_code = "HTTP_301"
  #   }
  # }
}

# # create a listener on port 443 with forward action
# resource "aws_lb_listener" "alb_https_listener" {
#   load_balancer_arn  = aws_lb.application_load_balancer.arn
#   port               = 443
#   protocol           = "HTTPS"
#   ssl_policy         = "ELBSecurityPolicy-2016-08"
#   #certificate_arn    = var.CERTIFICATE_ARN

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.alb_target_group.arn
#   }
# }

resource "aws_lb_target_group_attachment" "alb_tg_attachment" {
  count     = length(var.TARGET_INSTANCES)
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  port      = 8080
  target_id = var.TARGET_INSTANCES[count.index]
}