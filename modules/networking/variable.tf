variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks for the VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks for the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to deploy resources in"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = false
  description = "Flag to enable or disable NAT Gateway creation for the VPC"
}

variable "enable_vpc_endpoints" {
  type        = bool
  default     = false
  description = "Flag to enable or disable VPC Endpoints for the VPC"
}

variable "security_group_rules" {
  type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of security group rules to apply to the VPC security groups"
}