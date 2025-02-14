resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/dummy-data-api"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "api_gateway_logs" {
  name              = "/api-gateway/dummy-data-api"
  retention_in_days = 30
}

resource "aws_cloudwatch_metric_alarm" "ecs_cpu_high" {
  alarm_name          = "ECS-High-CPU-Usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/ECS"
  period             = 60
  statistic          = "Average"
  threshold          = 75
  alarm_description  = "Alarm when ECS CPU utilization exceeds 75%"
  actions_enabled    = true
  alarm_actions      = [aws_sns_topic.alerts.arn]

  dimensions = {
    ClusterName = var.ecs_cluster
    ServiceName = var.ecs_service
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  alarm_name          = "RDS-High-CPU-Usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/RDS"
  period             = 60
  statistic          = "Average"
  threshold          = 80
  alarm_description  = "Alarm when RDS CPU usage is over 80%"
  actions_enabled    = true
  alarm_actions      = [aws_sns_topic.alerts.arn]

  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }
}

resource "aws_sns_topic" "alerts" {
  name = "cloudwatch-alerts"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}