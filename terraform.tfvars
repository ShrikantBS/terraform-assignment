aws_region = "us-east-1"

# Networking
vpc_cidr = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

# API Rate Limiting
rate_limit = 1000

# ACM Certificate
acm_certificate_arn = "arn:aws:acm:us-east-1:xxxxxxxx:certificate/your-cert-id"

# ECS Configuration
cluster_name = "dummy-data-api-cluster"
task_cpu    = "512"
task_memory = "1024"
desired_count = 2

# Authentication
authentication = "COGNITO"

# Database
db_instance   = "db.t3.micro"
db_engine     = "postgres"
allocated_storage = 20
backup_retention  = 7
multi_az          = true
publicly_accessible = false

# CI/CD
repo_name = "terraform-assignment"

# Monitoring
enable_alarms  = true
enable_metrics = true