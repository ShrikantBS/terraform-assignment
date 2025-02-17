terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source     = "./modules/networking"
  vpc_cidr   = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  enable_nat_gateway = true
  enable_vpc_endpoints = true
  security_group_rules = [
    {
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ecs" {
  source      = "./modules/ecs"
  cluster_name = var.cluster_name
  vpc_id      = module.networking.vpc_id
  subnets     = module.networking.private_subnets
  runtime     = "FARGATE"
  task_cpu    = "512"
  task_memory = "1024"
  desired_count = 2
  container_port = 8080
}

module "rds" {
  source        = "./modules/rds"
  db_instance   = "db.t3.micro"
  engine        = "postgres"
  vpc_id        = module.networking.vpc_id
  subnets       = module.networking.private_subnets
  allocated_storage = 20
  backup_retention  = 7
  publicly_accessible = false
  multi_az          = true
}

module "alb" {
  source      = "./modules/alb"
  vpc_id      = module.networking.vpc_id
  subnets     = module.networking.public_subnets
  ecs_service = module.ecs.service_name
  enable_https = true
  certificate_arn = var.acm_certificate_arn
}

module "api_gateway" {
  source      = "./modules/api_gateway"
  auth_enabled = true
  rate_limit   = var.rate_limit
  authentication = "COGNITO"
  enable_logging = true
  stage_name = "prod"
}

module "cicd" {
  source      = "./modules/cicd"
  ecs_cluster = module.ecs.cluster_name
  repo_name   = var.repo_name
  ci_cd_tool  = "GITHUB_ACTIONS"
  enable_sast = true
  enable_code_quality = true
  enable_auto_deploy = true
}

module "monitoring" {
  source          = "./modules/monitoring"
  ecs_cluster     = module.ecs.cluster_name
  ecs_service     = module.ecs.service_name
  rds_instance_id = module.rds.db_instance
  alert_email     = "alerts@example.com"
}

