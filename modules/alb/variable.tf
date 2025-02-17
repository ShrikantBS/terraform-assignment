variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB will be deployed"
}

variable "subnets" { 
  type        = list(string)
  description = "List of subnet IDs for the ALB across multiple Availability Zones"
}

variable "certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for enabling HTTPS on the ALB"
}