output "db_instance_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "db_security_group_id" {
  value = aws_security_group.rds_sg.id
}