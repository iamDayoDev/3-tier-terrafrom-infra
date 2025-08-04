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
variable "app_tier_sg_id" {
  description = "Security group ID for the App Tier"
  type        = string
}
variable "app_instance_type" {
  description = "Instance type for the application servers"
  type        = string
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}
variable "app_asg_min_size" {
  description = "Minimum size of the application Auto Scaling group"
  type        = number
}
variable "app_asg_max_size" {
  description = "Minimum size of the application Auto Scaling group"
  type        = number
}
variable "app_asg_desired_capacity" {
  description = "Minimum size of the application Auto Scaling group"
  type        = number
}
variable "app_tg_arn" {
  description = "ARN of the application target group"
  type        = string
}
variable "app_instance_profile_name" {
  description = "Name of the IAM instance profile for the application servers"
  type        = string
}
