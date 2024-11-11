output "endpoint" {
  value       = aws_db_instance.rds_instance.endpoint
  description = "RDS Endpoint"
}
