data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] 
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] 
}

resource "aws_launch_configuration" "ghost_launch_configuration" {
  name_prefix          = "ghost_launch_configuration"
  image_id             = data.aws_ami.ubuntu_ami.image_id
  security_groups      = [aws_security_group.ghost_autoscaling_group_security_group.id]
  instance_type        = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  user_data = templatefile("${path.module}/init.sh",
    {
      "endpoint"  = aws_db_instance.mysql_instance.address,
      "database"  = aws_db_instance.mysql_instance.name,
      "username"  = local.mysql_credentials.username,
      "password"  = local.mysql_credentials.password,
      "admin_url" = "http://${aws_lb.ghost_lb.dns_name}",
      "url"       = "http://${aws_lb.ghost_lb.dns_name}"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ghost_autoscaling_group" {
  name                 = "ghost_autoscaling_group"
  launch_configuration = aws_launch_configuration.ghost_launch_configuration.name
  max_size             = var.asg_max_size
  min_size             = var.asg_min_size
  vpc_zone_identifier  = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  target_group_arns = [aws_lb_target_group.ghost_lb_target_group.arn]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "ghost_autoscaling_group_security_group" {
  name        = "ghost_autoscaling_group_security_group"
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.ghost_lb_security_group.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}
