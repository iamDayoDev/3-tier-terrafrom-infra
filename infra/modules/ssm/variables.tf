variable "db_password" {
  description = "Password for the database user"
  type        = string
  sensitive   = true
}
variable "internal_alb_dns" {
  description = "DNS name for the internal ALB"
  type        = string
}
variable "db_host_endpoint" {
  description = "Host for the database"
  type        = string
    default     = "aurora-mysql-cluster.cluster-xxxxxxxxxx.us-west-2.rds.amazonaws.com"
}
variable "db_database" {
  description = "Name of the database"
  type        = string
  default     = "three-tier-db"
}
variable "db_username" {
  description = "Username for the database"
  type        = string
  default     = "admin"
}