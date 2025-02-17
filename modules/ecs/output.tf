output "ecs_cluster_id" {
  value       = aws_ecs_cluster.main.id
  description = "The ID of the ECS Cluster"
}

output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.main.arn
  description = "The Amazon Resource Name (ARN) of the ECS Cluster"
}

output "ecs_service_name" {
  value       = aws_ecs_service.app.name
  description = "The name of the ECS Service running the application"
}

output "ecs_service_arn" {
  value       = aws_ecs_service.app.id
  description = "The Amazon Resource Name (ARN) of the ECS Service"
}

output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.app.arn
  description = "The ARN of the ECS Task Definition"
}

output "ecs_task_execution_role_arn" {
  value       = aws_iam_role.ecs_task_execution.arn
  description = "The ARN of the IAM Role used for ECS Task Execution"
}