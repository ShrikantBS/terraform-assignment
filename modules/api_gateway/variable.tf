variable "stage_name" { default = "prod" }
variable "rate_limit" { default = 100 }
variable "cognito_user_pool_arn" {}
variable "alb_dns_name" {}