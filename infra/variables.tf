variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}
variable "project_name" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}
variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}
variable "public_subnet_names" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets_names" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}
variable "app_instance_type" {
  description = "Instance type for the application servers"
  type        = string
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
variable "web_instance_type" {
  description = "Instance type for the application servers"
  type        = string
}
variable "web_asg_min_size" {
  description = "Minimum size of the application Auto Scaling group"
  type        = number
}
variable "web_asg_max_size" {
  description = "Minimum size of the application Auto Scaling group"
  type        = number
}
variable "web_asg_desired_capacity" {
  description = "Minimum size of the application Auto Scaling group"
  type        = number
}
variable "cluster_identifier" {
  description = "Identifier for the RDS cluster"
  type        = string
  default     = "aurora-mysql-cluster"
}
variable "db_engine" {
  description = "Engine version for the RDS cluster"
  type        = string
}
variable "db_engine_version" {
  description = "Engine version for the RDS cluster"
  type        = string
}
variable "database_name" {
  description = "Name of the database"
  type        = string
  default     = "three-tier-db"
}
variable "db_username" {
  description = "Master username for the RDS cluster"
  type        = string
  default     = "admin"
}
variable "db_password" {
  description = "Master password for the RDS cluster"
  type        = string
  default     = "password"
}
variable "db_allocated_storage" {
  description = "Allocated storage for the RDS cluster in GB"
  type        = number
}
variable "instance_class" {
  description = "Instance class for the RDS cluster instances"
  type        = string
}
