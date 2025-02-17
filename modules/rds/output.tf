output "db_instance_endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "The endpoint address of the RDS database instance"
}

output "db_security_group_id" {
  value       = aws_security_group.rds_sg.id
  description = "The ID of the security group associated with the RDS instance"
}