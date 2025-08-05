output "app_tg_arn" {
  description = "ARN of the application target group"
  value       = aws_lb_target_group.app_tg.arn
}
output "web_tg_arn" {
  description = "ARN of the web target group"
  value       = aws_lb_target_group.web_tg.arn
}
output "internal_alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.internal_alb.dns_name
}
output "external_alb_dns_name" {
  description = "DNS name of the External Application Load Balancer"
  value       = aws_lb.external_alb.dns_name
}