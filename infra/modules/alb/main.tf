resource "aws_lb" "internal_alb" {
    name               = "${var.project_name}-internal-alb"
    internal           = true
    load_balancer_type = "application"
    security_groups    = [var.internal_alb_sg_id]
    subnets            = var.private_subnet_ids

    tags = {
        Name = "${var.project_name}-internal-alb"
        Project = var.project_name
    }
}

resource "aws_lb_target_group" "app" {
    name     = "${var.project_name}-app-tg"
    port     = 4000
    protocol = "HTTP"
    vpc_id   = var.vpc_id

    health_check {
        path                = "/health"
        protocol            = "HTTP"
        matcher             = "200"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
    }
        tags = {
        Name = "${var.project_name}-app-tg"
        Project = var.project_name
}
}

resource "aws_lb_listener" "app_http" {
    load_balancer_arn = aws_lb.internal_alb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.app.arn
    }
}

resource "aws_lb" "external_alb" {
    name               = "${var.project_name}-external-alb"
    internal           = true
    load_balancer_type = "application"
    security_groups    = [var.external_alb_sg_id]
    subnets            = var.private_subnet_ids

    tags = {
        Name = "${var.project_name}-external-alb"
        Project = var.project_name
    }
}

resource "aws_lb_target_group" "web" {
    name     = "${var.project_name}-web-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc_id

    health_check {
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
    }
    tags = {
        Name = "${var.project_name}-web-tg"
        Project = var.project_name
    }
}

resource "aws_lb_listener" "web_http" {
    load_balancer_arn = aws_lb.external_alb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.web.arn
    }
}

