resource "aws_db_subnet_group" "main" {
  name       = "${var.db_instance}-subnet-group"
  subnet_ids = var.subnets

  tags = {
    Name = "${var.db_instance}-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Should be restricted to ECS SG in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}

resource "aws_db_instance" "main" {
  identifier              = var.db_instance
  engine                 = var.engine
  instance_class         = var.instance_type
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  username              = var.db_username
  password              = var.db_password
  publicly_accessible   = var.publicly_accessible
  db_subnet_group_name  = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  backup_retention_period = var.backup_retention
  multi_az              = var.multi_az

  tags = {
    Name = "${var.db_instance}"
  }
}