resource "aws_launch_template" "app" {
    name_prefix   = "${var.project_name}-app"
    image_id      = data.aws_ami.amazon_linux_2023.id
    instance_type = var.app_instance_type
    vpc_security_group_ids = [var.app_tier_sg_id]
    user_data = base64encode(templatefile("${path.module}/app.sh", {}))

    tag_specifications {
        resource_type = "instance"
        tags = {
            Name = "${var.project_name}-app"
        }
    }

    iam_instance_profile {
        name = var.app_instance_profile_name
    }
}

resource "aws_autoscaling_group" "app_server_asg" {
    name                      = "${var.project_name}-app-asg"
    min_size                  = var.app_asg_min_size
    max_size                  = var.app_asg_max_size
    desired_capacity          = var.app_asg_desired_capacity
    vpc_zone_identifier       = var.private_subnet_ids
    target_group_arns =         [var.app_tg_arn]
    launch_template {
        id      = aws_launch_template.app.id
        version = "$Latest"
    }

    health_check_type         = "EC2"
    health_check_grace_period = 300

    tag {
        key                 = "Name"
        value               = "${var.project_name}-app-server"
        propagate_at_launch = true
    }

    lifecycle {
        create_before_destroy = true
    }
}

