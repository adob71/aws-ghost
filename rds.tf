resource "aws_db_instance" "mysql_instance" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = var.mysql_engine_version
  instance_class         = var.mysql_instance_class
//  name                   = var.mysql_name
  db_name                   = var.mysql_name
  username               = local.mysql_credentials.username
  password               = local.mysql_credentials.password
  db_subnet_group_name   = aws_db_subnet_group.mysql_subnet_group.name
  parameter_group_name   = var.mysql_parameter_group_name
  vpc_security_group_ids = [aws_security_group.mysql_security_group.id]
  skip_final_snapshot    = true
}

data "aws_secretsmanager_secret_version" "mysql_credentials" {
  secret_id = "mysql_credentials"
}

locals {
  mysql_credentials = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)
}

resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql_subnet_group"
  subnet_ids = [module.vpc.database_subnets[0], module.vpc.database_subnets[1]]
  tags = var.tags
}

resource "aws_security_group" "mysql_security_group" {
  name        = "mysql_security_group"
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "TCP"
    security_groups = [aws_security_group.ghost_autoscaling_group_security_group.id]
  }
  egress {
    from_port = 3306
    to_port   = 3306
    protocol  = "TCP"
    security_groups = [aws_security_group.ghost_autoscaling_group_security_group.id]
  }
  tags = var.tags
}
