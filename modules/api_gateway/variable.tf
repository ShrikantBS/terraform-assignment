variable "stage_name" { 
  type    = string
  default = "prod"
  description = "API Gateway stage name (e.g., dev, staging, prod)"
}

variable "rate_limit" { 
  type    = number
  default = 100
  description = "Maximum requests per second allowed by API Gateway"
}

variable "cognito_user_pool_arn" { 
  type        = string
  description = "ARN of the Cognito User Pool for API Gateway authentication"
}

variable "alb_dns_name" { 
  type        = string
  description = "DNS name of the ALB that hosts the backend service"
}