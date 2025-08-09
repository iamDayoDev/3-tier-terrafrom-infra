resource "aws_launch_template" "web" {
    name_prefix   = "${var.project_name}-web"
    image_id      = data.aws_ami.amazon_linux_2023.id
    instance_type = var.web_instance_type
    user_data = base64encode(templatefile("${path.module}/web.sh", {}))

    tag_specifications {
        resource_type = "instance"
        tags = {
            Name = "${var.project_name}-web"
        }
    }

    iam_instance_profile {
        name = var.instance_profile_name
    }
    network_interfaces {
        security_groups       = [var.web_tier_sg_id, var.external_alb_sg_id]
        associate_public_ip_address = true
    }
}

resource "aws_autoscaling_group" "web_server_asg" {
    name                      = "${var.project_name}-web-asg"
    min_size                  = var.web_asg_min_size
    max_size                  = var.web_asg_max_size
    desired_capacity          = var.web_asg_desired_capacity
    vpc_zone_identifier       = var.public_subnet_ids
    target_group_arns =         [var.web_tg_arn]
    launch_template {
        id      = aws_launch_template.web.id
        version = "$Latest"
    }

    health_check_type         = "EC2"
    health_check_grace_period = 300

    tag {
        key                 = "Name"
        value               = "${var.project_name}-web-server"
        propagate_at_launch = true
    }

    lifecycle {
        create_before_destroy = true
    }
}

