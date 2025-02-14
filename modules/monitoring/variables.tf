variable "ecs_cluster" {
  description = "ECS Cluster Name"
  type        = string
}

variable "ecs_service" {
  description = "ECS Service Name"
  type        = string
}

variable "rds_instance_id" {
  description = "RDS Instance Identifier"
  type        = string
}

variable "alert_email" {
  description = "Email for CloudWatch Alerts"
  type        = string
}