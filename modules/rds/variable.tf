variable "vpc_id" {}
variable "subnets" { type = list(string) }
variable "db_instance" {}
variable "engine" { default = "postgres" }
variable "instance_type" {}
variable "allocated_storage" {}
variable "db_username" {}
variable "db_password" {}
variable "publicly_accessible" { default = false }
variable "backup_retention" { default = 7 }
variable "multi_az" { default = true }