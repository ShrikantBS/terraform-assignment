output "api_gateway_url" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.aws_region}.amazonaws.com/${var.stage_name}/"
  description = "Base URL of the deployed API Gateway"
}