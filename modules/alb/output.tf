output "alb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "The DNS name of the Application Load Balancer (ALB)"
}

output "alb_arn" {
  value       = aws_lb.main.arn
  description = "The Amazon Resource Name (ARN) of the ALB"
}

output "alb_target_group_arn" {
  value       = aws_lb_target_group.ecs.arn
  description = "The ARN of the Target Group associated with the ALB"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb_sg.id
  description = "The Security Group ID assigned to the ALB"
}