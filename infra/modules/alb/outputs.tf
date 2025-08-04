output "app_tg_arn" {
  description = "ARN of the application target group"
  value       = aws_lb_target_group.app_tg.arn
}
output "web_tg_arn" {
  description = "ARN of the web target group"
  value       = aws_lb_target_group.web_tg.arn
}