output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = module.ecs.cluster_name
}

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = module.ecs.service_name
}

output "api_gateway_url" {
  description = "API Gateway Endpoint"
  value       = module.api_gateway.api_gateway_url
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = module.rds.db_endpoint
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = module.alb.alb_dns_name
}