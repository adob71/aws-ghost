#Global 

variable "region" {
  description = ""
  type        = string
  default     = "eu-west-2"
}

variable "tags" {
  description = ""
  default = {
    Terraform = "true"
    Project   = "ghost"
  }
}

#VPC

variable "vpc_name" {
  description = ""
  type        = string
  default     = "ghost_vpc"
}

variable "vpc_cidr" {
  description = ""
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = ""
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "public_subnets" {
  description = ""
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "database_subnets" {
  description = ""
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

#RDS

variable "mysql_engine_version" {
  description = ""
  type        = string
  default     = "5.7"
}

variable "mysql_instance_class" {
  description = ""
  type        = string
  default     = "db.t2.micro"
}

variable "mysql_name" {
  description = ""
  type        = string
  default     = "ghostdb"
}

variable "mysql_parameter_group_name" {
  description = ""
  type        = string
  default     = "default.mysql5.7"
}

#ASG

variable "ec2_instance_type" {
  description = ""
  type        = string
  default     = "t2.micro"
}

variable "asg_max_size" {
  description = ""
  type        = string
  default     = 1
}

variable "asg_min_size" {
  description = ""
  type        = string
  default     = 1
}
