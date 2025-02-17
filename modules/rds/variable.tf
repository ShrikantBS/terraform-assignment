variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the RDS instance will be deployed"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs for the RDS instance to be deployed in"
}

variable "db_instance" {
  type        = string
  description = "The name of the RDS instance"
}

variable "engine" {
  type        = string
  default     = "postgres"
  description = "The database engine for the RDS instance (e.g., postgres, mysql)"
}

variable "instance_type" {
  type        = string
  description = "The instance type for the RDS instance (e.g., db.t3.micro)"
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage (in GB) for the RDS instance"
}

variable "db_username" {
  type        = string
  description = "The username for the RDS database"
}

variable "db_password" {
  type        = string
  description = "The password for the RDS database"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Flag to determine if the RDS instance should be publicly accessible"
}

variable "backup_retention" {
  type        = number
  default     = 7
  description = "The number of days to retain backups for the RDS instance"
}

variable "multi_az" {
  type        = bool
  default     = true
  description = "Flag to enable Multi-AZ deployment for high availability"
}