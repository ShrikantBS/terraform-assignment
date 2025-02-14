variable "cluster_name" {}
variable "vpc_id" {}
variable "subnets" { type = list(string) }
variable "container_image" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "container_port" {}
variable "desired_count" {}
variable "target_group_arn" {}
variable "environment_variables" {
  type    = list(object({ name = string, value = string }))
  default = []
}