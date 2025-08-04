output "app_tg_arn" {
  description = "ARN of the application target group"
  value       = module.alb.app_tg_arn
}
output "web_tg_arn" {
  description = "ARN of the web target group"
  value       = module.alb.web_tg_arn
}