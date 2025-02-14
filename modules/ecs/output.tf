output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "service_name" {
  value = aws_ecs_service.app.name
}

output "task_definition" {
  value = aws_ecs_task_definition.app.arn
}