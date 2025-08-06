output "db_host_endpoint" {
  description = "The endpoint of the RDS cluster"
  value       = aws_rds_cluster.aurora_mysql.endpoint
}
output "db_reader_endpoint" {
  description = "The reader endpoint of the RDS cluster"
  value       = aws_rds_cluster.aurora_mysql.reader_endpoint
  
}