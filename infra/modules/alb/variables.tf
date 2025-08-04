variable "project_name" {
  description = "Name of the project"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID where the resources will be created"
  type        = string
}
variable "internal_alb_sg_id" {
  description = "Security group ID for the internal ALB"
  type        = string
}
variable "external_alb_sg_id" {
  description = "Security group ID for the internal ALB"
  type        = string
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs for the internal ALB"
  type        = list(string)
}
