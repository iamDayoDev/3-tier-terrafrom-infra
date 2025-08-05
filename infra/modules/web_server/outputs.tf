output "app_server_launch_template_id" {
    description = "ID of the Launch Template used by the app server"
    value       = aws_launch_template.web.id
}

