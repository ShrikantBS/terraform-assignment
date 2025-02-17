variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster where the service will run"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the ECS cluster and services will be deployed"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs in which ECS tasks should run"
}

variable "container_image" {
  type        = string
  description = "The Docker image used for the ECS container"
}

variable "task_cpu" {
  type        = string
  description = "The amount of CPU resources allocated to each ECS task (e.g., 256 for 0.25 vCPU)"
}

variable "task_memory" {
  type        = string
  description = "The amount of memory allocated to each ECS task (e.g., 512 for 0.5 GB)"
}

variable "container_port" {
  type        = number
  description = "The port on which the container will listen for requests"
}

variable "desired_count" {
  type        = number
  description = "The desired number of ECS task instances to run in the service"
}

variable "target_group_arn" {
  type        = string
  description = "The ARN of the Target Group that the ECS service will register with"
}

variable "environment_variables" {
  type        = list(object({ name = string, value = string }))
  description = "List of environment variables to pass to the ECS container"
  default     = []
}