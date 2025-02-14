output "log_group_ecs" {
  description = "CloudWatch Log Group for ECS"
  value       = aws_cloudwatch_log_group.ecs_log_group.name
}

output "log_group_api_gateway" {
  description = "CloudWatch Log Group for API Gateway"
  value       = aws_cloudwatch_log_group.api_gateway_logs.name
}

output "sns_alert_topic" {
  description = "SNS Topic ARN for CloudWatch Alerts"
  value       = aws_sns_topic.alerts.arn
}