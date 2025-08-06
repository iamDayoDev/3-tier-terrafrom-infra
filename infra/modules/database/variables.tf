variable "project_name" {
  description = "Name of the project"
  type        = string
}
variable "cluster_identifier" {
  description = "Identifier for the RDS cluster"
  type        = string
  default     = "aurora-mysql-cluster"
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs for the RDS instances"
  type        = list(string)
}
variable "db_tier_sg_id" {
  description = "List of security group IDs for the database tier"
  type        = list(string)
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
variable "master_username" {
  description = "Master username for the RDS cluster"
  type        = string
  default     = "admin"
}
variable "master_password" {
  description = "Master password for the RDS cluster"
  type        = string
  default     = "password"
}
variable "db_allocated_storage" {
  description = "Allocated storage for the RDS cluster in GB"
  type        = number
  default     = 20
}
variable "instance_class" {
  description = "Instance class for the RDS cluster instances"
  type        = string
}
