output "internal_alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.internal_alb_dns_name
}
output "external_alb_dns_name" {
  description = "DNS name of the External Application Load Balancer"
  value       = module.alb.external_alb_dns_name
}