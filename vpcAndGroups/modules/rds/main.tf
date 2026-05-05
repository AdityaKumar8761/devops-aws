resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.environment}-rds-sg"
  description = "Security group for RDS allowing traffic only from EC2 SG"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = toset(var.rds_ingress_ports)
    content {
      description     = "Database access from EC2 instances"
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      security_groups = [var.ec2_sg_id]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-rds-sg"
    Environment = var.environment
  }
}

resource "aws_db_instance" "main" {
  identifier             = "${var.environment}-${var.db_name}"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  skip_final_snapshot = true # Typically false in prod, true for simplicity in learning

  # Prevent DB deletion
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "${var.environment}-rds"
    Environment = var.environment
  }
}
