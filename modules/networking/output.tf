output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC where all resources are deployed"
}

output "public_subnets" {
  value       = aws_subnet.public[*].id
  description = "List of IDs of the public subnets in the VPC"
}

output "private_subnets" {
  value       = aws_subnet.private[*].id
  description = "List of IDs of the private subnets in the VPC"
}